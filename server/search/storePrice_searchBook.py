from django.shortcuts import render
from django.http.response import JsonResponse
from pkg import get_request_data
# from polls.models import Books
import time
import asyncio
urls = {
    'taaze': 'https://www.taaze.tw/rwd_searchResult.html?keyType%5B%5D=0&keyword%5B%5D=',
    'sanmin': 'https://www.sanmin.com.tw/search/index/?ct=ISBN&qu=%s&ls=SD',
}


async def taaze(index, price):
  url = urls['taaze'] + index
  soup = await get_request_data(method='get', url=url)
  item = soup.find('div', class_='media')
  index['tazze'] = item['rel']
  price['tazze'] = item['data-saleprice_28']


async def sanmin(index, price):
  url = urls['sanmin'] % index
  soup = await get_request_data(method='get', url=url)
  price["sanmin"] = soup.find('span', class_="price").text
  index["sanmin"] = soup.find('div', class_="resultBooksImg").a['href']


async def getAllStore():
  startTime = time.time()
  index = {"tazze": None, "sanmin": None}
  price = {"tazze": None, "sanmin": None}
  key = '9789864764846'
  tazzeF = asyncio.create_task(taaze(index, price))
  sanminF = asyncio.create_task(sanmin(index, price))
  await tazzeF
  await sanminF