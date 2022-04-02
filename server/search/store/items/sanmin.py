from packages.package import get_request_data, textClean
# from packages.myText import textClean
# from packages.get_request_data import get_request_data
import re
def sanmin(soup):
    # soup = getHtml(method='get', url=tmp_url)
    if soup!=None:
        data = []
        item_soup = soup.find('div', id='normal-list').find_all('div', class_='condition')
        for i in item_soup:
            try:
                title = i.h3.a
                index = title['href'].split('/')[-1].strip()
                
                for word_index, j in enumerate(title.text):
                    if j=='.':
                        title = title.text[word_index+1:]
                        break

                price = i.find('span', class_='price')
                if price !=None:
                    price = price.text
                else:
                    try:
                        new_crazy = filter(str.isdigit, i.find('div', class_='resultBooksLayout').p.text.strip())
                        price = ''.join(list(new_crazy))
                    except: # 完全沒價錢
                        price = ''
                author = i.find('span', class_='ProdAu')
                if author!=None:
                    author= ', '.join([j.text.strip() for j in author.find_all('a')]).strip(),
                else:    
                    author=''
                    
                date = i.find('p', class_='author')
                if date!=None:
                    try:
                        date= date.find_all('span', class_='pap')[-1].contents[-1].strip()
                    except:
                        print('date error')
                        date = ''
                else:    
                    date=''
                
                pub = i.find('span', class_='ProdPu')
                if pub!=None:
                    pub= pub.a.text.strip()
                else:    
                    pub=''

                data.append(
                    {'index':index,
                    'imgURL':i.find('img', class_="lazyload")['original'].strip(),
                    'title':title.strip(),
                    'price':price.strip() if price.strip()!=None else "0",
                    'date':date,
                    'author':author,
                    'pub':pub}
                )
            except:
                print('sssss')
        print(data)
        return {
            'status':True,
            'info':data,
            # 'page':soup.find('a', class_='arrivel')['value']
        }
    return {
        'status':False,
        'info':[]
    }