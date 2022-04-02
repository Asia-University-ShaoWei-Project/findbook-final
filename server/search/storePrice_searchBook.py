from django.shortcuts import render
from django.http.response import JsonResponse
from packages.package import get_request_data
from packages.checkISBN import checkISBN
from django.core.exceptions import ObjectDoesNotExist
# from polls.models import Books
import time
import asyncio


async def taaze(index, price): 
    print('TAAZE')
    url = 'https://www.taaze.tw/rwd_searchResult.html?keyType%5B%5D=0&keyword%5B%5D=' + index
    soup = await get_request_data(method ='get',url = url)
    item  = soup.find('div', class_='media')
    index['tazze'] = item['rel']
    price['tazze'] = item['data-saleprice_28']
async def sanmin(index, price):
    print('SANMIN')
    url = 'https://www.sanmin.com.tw/search/index/?ct=ISBN&qu=%s&ls=SD' % index
    soup = await get_request_data(method ='get',url = url)
    price["sanmin"] = soup.find('span', class_="price").text
    index["sanmin"] = soup.find('div', class_="resultBooksImg").a['href']

async def getAllStore():
    startTime = time.time()
    index = {"tazze":None, "sanmin":None}
    price = {"tazze":None, "sanmin":None}
    key = '9789864764846'
    tazzeF = asyncio.create_task(taaze(index, price)) 
    sanminF = asyncio.create_task(sanmin(index, price))
    await tazzeF
    await sanminF


# endTime = time.time()
# print(endTime-startTime)




def otherStore(key):
    price = None
    return price

def ajaxPrice(request):
    import json
    key = request.GET['key']
    isISBN = checkISBN(key)
    if isISBN[0]:
        try:
            # book = Books.objects.get(ISBN_13 = key) if isISBN[1]==13 else Books.objects.get(ISBN_10 = key)
            # has index??
            int('str')
            return JsonResponse({'message':'DB has ISBN'})
        except:
            return JsonResponse([tazze(key), otherStore(key)], safe=False)

    else:
        # Is not ISBN
        return JsonResponse([None, None])

            

