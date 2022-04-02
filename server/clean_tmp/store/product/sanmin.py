from packages.package import get_request_data, textClean
from searchBook.models import IndexSanmin

# from packages.get_request_data import get_request_data
def sanmin(soup,book_index):
    intrData = []
    infoData = {['title','price','date','pub','author','isbn', 'page',][i]:None for i in range(7)}
    book_model = IndexSanmin.objects.filter(index=book_index)
    if len(book_model)>0:
        book_model = book_model[0].book
    else:
        book_model = None
    # try:
        # --- Price ---  (簡單暴力法, 待修改)
        # str1 = soup.find('script', {'type':'application/ld+json'}).contents[0].strip()
        # data = json.loads(str1)
        # data['offers']['price']
    if book_model!=None:
        infoData['price'] = book_model.price
    else:
        infoData['price'] = {'sanmin': soup.find('span', class_='fs16 Bold fsRed fsale').text.strip()}
    

    # --- image URL ---
    # 書封面 cdnec.sanmin.com.tw/product_images/
    # other cdnec.sanmin.com.tw/tryread/big/
    
    tmp = soup.find('div', class_='gallery-top')
    if tmp:
        tmp = tmp.findAll('div', class_='swiper-slide')   # 大圖示欄
        # //cdnec.sanmin.com.tw/product_images/986/986502596.jpg
        imgURL = [tmp[0].img['src'].split('product_images/')[-1]]  # first img 
        # //cdnec.sanmin.com.tw/tryread/small/986/s_986502596_b1.jpg
        # //cdnec.sanmin.com.tw/tryread/big/986/986502596_b1.jpg
        imgURL.extend([i.img['src'].split('big/')[-1] for i in tmp[1:]])  # other img
    else:
        imgURL = [soup.find('img', class_='mainImg')['src'].split('product_images/')[-1]]
    
    # tmp = soup.find('div', class_='gallery-top').find_all('div', class_='swiper-slide')   # 大圖示欄
    # imgURL = [tmp[0].img['src'][37:]]  # first img 
    # imgURL.extend([i.img['src'][40:] for i in tmp[1:]])  # other img

    # --- Information ---
    tag = {'書名':'title','ISBN':'isbn','頁數':'page','出版社':'pub','作者':'author', '出版日期':'date'}
    findInfo = soup.find('meta', {'name':'description'})['content']
    for i in findInfo.split('，'):  # book info處理
        tmp =  i.split('：')
        if len(tmp)>2: tmp = [tmp[0], textClean(splitChar='：', text=i, loop=1)] # 標題, 內容(防止內容出現':'有問題)
        key = tag[tmp[0]] if (tmp[0] in tag) else None # 確標籤有在需求(tag)裡
        if key: infoData[key] = tmp[1]  # 資料內容

    # --- Intr ---
    # 標籤 ---
    tag = {
        "商品簡介": 'intr',
        "作者簡介": 'author',
        "目次": 'contents',
    }
    tabTitle_find = soup.find_all('div', class_='tab2')
    intrData = [{"title": None, "content": None} for i in range(len(tabTitle_find))]
    for index, i in enumerate(tabTitle_find):
        tmp = i.text.strip()  # ex: 商品簡介
        intrData[index]['title'] = tag[tmp] if (tmp in tag) else None  # ex: intr, else-> None 
    # 內容 ---    
    contents_find = soup.find_all('div', class_='productContent')
    for indexI, i in enumerate(contents_find):
        word = ''
        for j in i:
            tmp = j.string
            # if text is None -> loop data get string then join '\n' 
            word += f'\n{tmp}\n' if tmp!=None else "\n".join([k.string for k in j if k.string!=None])+'\n'
        intrData[indexI]['content'] = word
    return {
        'status': True,
        'imgURL': imgURL,
        'info': infoData,
        'intr': intrData,
    }
    # except:
    #     print('error')
    #     return {
    #         'status':False
    #     }