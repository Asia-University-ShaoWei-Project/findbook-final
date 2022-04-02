# TODO polls update.py
from .models import Top

from packages.package import get_request_data
import time

tenlong_bestseller_url = 'https://www.tenlong.com.tw/zh_tw/bestselling'


def UpdateBastseller(request):
  Top.objects.all().delete()
  soup = get_request_data(tenlong_bestseller_url)
  # _date = soup.find(class_='content').h2.text.split(' ')[-1]
  pageHtml = soup.find(class_='pagination')
  pageCount = len(pageHtml.findAll('a')) + 1
  pageUrl = pageHtml.find('a')['href'][:-1]
  data = content_data(soup)

  if pageCount > 1:
    for i in range(2, pageCount):
      time.sleep(1)
      soup = get_request_data('https://www.tenlong.com.tw/'+pageUrl+str(i))
      content_data(soup)
  for i in range(len(data)):
    for j in range(len(data[i])):
      Top(
          page=i+1,
          isbn=data[i][j]['isbn'],
          name=data[i][j]['name'],
          price=data[i][j]['price'],
          img_url=data[i][j]['url']
      ).save()


def content_data(soup) -> list:
  content = soup.find('div', class_='list-wrapper').ul.findAll('li')
  data = [{}]*len(content)
  for i, item in enumerate(content):
    data[i] = {
        'url': item.find('img')['src'].split('https://cf-')[1],
        'name': item.find('h3').a.text,
        'isbn': item.find('a', class_='cover')['href'].split('products/')[1][:13],
        'price': item.find('div', class_='pricing').text.split('$')[-1].strip()
    }
  return data
