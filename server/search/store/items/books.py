import re
from .book_filter import index_filter

def books(soup):
    try:
        # soup data
        item_soup = soup.find('ul', class_='searchbook').findAll('li', class_="item")
        
        # get item index
        item_indexs = []
        num_list = []
        resoult_data = []
        # pattern = re.compile("[0-9]*") # 有英文
        for i in item_soup:
            value = i.find('input', {'name':'C1'})
            if value!=None:
                item_indexs.append(value['value'])
            else:
                try:
                    href = i.find('a', {'rel':'mid_image'})['href']
                    value = re.split('item/|/page',href)[1]
                    # if pattern.fullmatch(value)!=None:
                    item_indexs.append(value)
                    # else:
                    #     item_indexs.append(None)
                except:
                    print('取得item index錯誤...')
        # find index model and           
        num_list, resoult_data = index_filter(
            rq_store='books',
            item_indexs=item_indexs
        )
        # final find soup

        for i in num_list:
            tmp_soup = item_soup[i]
            resoult_data[i] = {
                'exist':{},
                'index': tmp_soup.find('input')['value'].strip(),
                'imgURL': tmp_soup.find('img')['data-original'].strip(),
                'title': tmp_soup.find('h3').a['title'].strip(),
                'price': tmp_soup.find('span', class_='price').findAll('strong')[-1].b.text.strip(),
                'date': tmp_soup.find(text=re.compile('出版日期')).split(':')[-1].strip(),
                'author': ', '.join([j['title'] for j in tmp_soup.findAll('a', {'rel': 'go_author'})]),
                'pub': tmp_soup.find('a', {'rel': 'mid_publish'}).text,
            }
        return {
            'status': True,
            'info': resoult_data
            # 'page':soup.find('a', class_='arrivel')['value']
        }
    except:
        print('error')
        return {
            'status': False,
            'info': []
        }
# page = soup.find('div', class_='page').span.text
        # page = [[i for i in range(10)], 1, page]
