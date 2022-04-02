from packages.package import textClean
# from packages.myText import textClean
# from packages.get_request_data import get_request_data
def kingStore(soup):
    soup = soup.find('ul', class_='displaycol')
    def getInfo(spanClass):
        return [i.b.text for i in soup.findAll('span', class_=spanClass)]
    img = [textClean('/', i['data-src'], loop=3, notReverse=False) for i in soup.findAll('img', class_='lazyload')]
    title = []
    index = []
    for i in soup.findAll('h3', class_='pdnamebox'):
        title.append(i.text)
        index.append(i.a['href'].split('?')[0].split('/')[-1])
#     title = [ for i in tmp]
    price = [i.findAll('b')[-1].text for i in soup.findAll('div', class_='buymixbox')]
    author = getInfo('author')
    pub = getInfo('publish')
    date = getInfo('pubdate')
    if len(img) == len(title) == len(price) == len(author) == len(pub) == len(date):
        return {
            'status':True,
            'info':[
                {
                    'index':index[i],
                    'imgURL':img[i],
                    'title':title[i],
                    'price':price[i],
                    'date':date[i],
                    'author':author[i],
                    'pub':pub[i],          
                } for i in range(len(title))
            ],
        }
    return {
        'status':False,
        'info':[]
    }
    