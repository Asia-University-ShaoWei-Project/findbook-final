# TODO polls update.py
from .models import Top

from packages.package import get_request_data


def updateTop(request):
  import time
  Top.objects.all().delete()
  testdata = list()

  def content_data(soup):
    content = soup.find('div', class_='list-wrapper').ul.findAll('li')
    _data = [{}]*len(content)
    for i, item in enumerate(content):

      _data[i] = {
          'url': item.find('img')['src'].split('https://cf-')[1],
          'name': item.find('h3').a.text,
          'isbn': item.find('a', class_='cover')['href'].split('products/')[1][:13],
          'price': item.find('div', class_='pricing').text.split('$')[-1].strip()
      }
    testdata.append(_data)

  soup = get_request_data('https://www.tenlong.com.tw/zh_tw/bestselling')
  # _date = soup.find(class_='content').h2.text.split(' ')[-1]
  pageHtml = soup.find(class_='pagination')
  pageCount = len(pageHtml.findAll('a')) + 1
  pageUrl = pageHtml.find('a')['href'][:-1]
  content_data(soup)

  if pageCount > 1:
    for i in range(2, pageCount):
      time.sleep(1)
      soup = get_request_data('https://www.tenlong.com.tw/'+pageUrl+str(i))
      content_data(soup)

  for i in range(len(testdata)):
    for j in range(len(testdata[i])):
      Top(
          page=i+1,
          isbn=testdata[i][j]['isbn'],
          name=testdata[i][j]['name'],
          price=testdata[i][j]['price'],
          img_url=testdata[i][j]['url']
      ).save()
  print('Top Down!')
