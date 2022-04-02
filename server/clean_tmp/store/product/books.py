from packages.package import get_request_data, textClean
from searchBook.models import IndexBooks

def books(soup, book_index):
    intrData = []
    infoData = {['title','price','date','pub','author','isbn', 'page',][i]:None for i in range(7)}

    book_model = IndexBooks.objects.filter(index=book_index)
    if len(book_model)>0:
        book_model = book_model[0].book
    else:
        book_model = None
    try:
        # --- price ---
        if book_model!=None:
            infoData['price'] = book_model.price
        else:
            infoData['price'] = {'books':soup.find('strong',class_='price01').text.strip()}
        # --- Image URL---
        imgURL = []
        for i in soup.find_all('ul', {'style':'float:left;'}):
            for j in i.find_all('img'):
                imgURL.append(j['src'].split('&amp')[0])
        # for i in soup.findAll('ul', class_='li_box'):
        #     for j in i.findAll('li'):
        #         tmp = j.img['src']
        #         imgURL.append("%s%s" % (tmp[8:11], tmp.split('/img/')[1].split('&v=')[0]))
                # imgURL = tmp
        # --- Information ---
        tag = {'書名':'title','ISBN':'isbn','頁數':'page','出版社':'pub','作者':'author', '出版日期':'date'}
        findInfo = soup.find('meta', {'name':'description'})['content']
        for i in findInfo.split('，'):  # book info處理
            tmp = i.split('：')
            if len(tmp)>2: tmp = [tmp[0], textClean(splitChar='：', text=i, loop=1)] # 標題, 內容(防止內容出現':'有問題)
            key = tag[tmp[0]] if (tmp[0] in tag) else None # 確標籤有在需求(tag)裡
            if key: infoData[key] = tmp[1]  # 資料內容
        # --- Intr ---
        soup = soup.find('div', class_="grid_19").findAll('div', class_= 'mod_b type02_m057 clearfix')
        tag = {'內容簡介':'intr', "作者介紹":'author', '目錄':'contents'}
        for i in soup:
            title = i.find('h3').string
            tabTitle = tag[title] if title in tag else None

            findContent = i.find('div', class_='content')
            content = [i.string for i in findContent]
            if key: intrData.append( 
                {
                    "title":tabTitle,
                    "content":"\n".join(content)
                }
            )
        return {
            'status': True,
            'imgURL': imgURL,
            'info': infoData,
            'intr': intrData,
        }
    except:
        return {
            'status':False,
        }