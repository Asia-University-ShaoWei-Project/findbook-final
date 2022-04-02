from django.shortcuts import render
from django.http.response import JsonResponse, HttpResponse
from packages.package import get_request_data, checkISBN
# from django_user_agents.utils import get_user_agent
import urllib
# def checkey(request):
#     key = request.GET.get('key')  # user type key
#     store = request.GET.get('st')  # user type key
#     method = request.GET.get('me')  # user type key
#     book = request.GET.get('bo')  # user type key

#     return render(request, 'Search/cards.html', searchISBN(key, [store, method, book]))

#     # service = request.GET.get('service') # from pc or phone
#     # isISBN = checkISBN(key) # check this key is ISBN?
#     # print('-> ISBN') if isISBN[0] else print('-> Name')
#     # if not isISBN[0]:
#     #     return searchBooks(request, key= key, service= service)
#     # else:  # if job is `index` -> search books.com get ISBN -> ajax search other bookstore -> sent price
#     #     return render(request, 'Search/cards.html', searchISBN(key, isISBN[1]))
#     return HttpResponse(request, 'aaa')


def test(request):
  # form what store?   # 'books', 'sanmin..
  req_store = request.GET.get('store')
  reqIndex = request.GET.get('index')
  data = {'status': True, 'info': [1, 2, 3], 'imgURL': ['a', 'b', 'c']}
  print('store:', req_store, ' index:', reqIndex)
  return result(request, data, 'index')


def result(request, data, method):
  if request.user_agent.is_mobile or request.user_agent.is_tablet:
    print('is mobile')
    return JsonResponse(data)
  else:
    print('is pc')
    print('My data : ', data)
    title = {'mult': 'testMult', 'index': 'testIndex'}[method]
    print('My html :%s.html' % (title))
    # title = {'mult':'cards', 'index':'singlePage'}[method]
    return JsonResponse(data)

    # return render(request, 'Search/%s.html'% title, data)


def testMultSearch(request):
  from .store.items import books, sanmin, kingStone
  from searchBook.models import Book
  req_page = request.GET.get('page')  # ex: 1
  req_key = request.GET.get('key')  # ex: 'python', 'java', 'golang'
  req_store = request.GET.get('store')  # ex: books, sanmin, kingstone
  req_sort = request.GET.get('sort')  # ex: dateN2O(date new to old)
  req_method = request.GET.get('method')  # ex: 'user key'
  req_type = request.GET.get('type')  # ex: 'all, book, ebook'

  resultURL = {
      'books': {
          'baseURL': 'https://search.books.com.tw/search/query/cat/{type}/key/{key}/sort/{sort}/{method}page/{page}/v/0/',
          'method': {
              'all': '',
              'au': 'adv_author/1/',
              'pu': 'adv_pub/1/ms2/ms2_1/',
          },
          'sort': {
              'default': '1',
              'dateN2O': '5',
              'dateO2N': '6',
              'priceH2L': '7',
              'priceL2H': '8'
          },
          'type': {
              'all': 'all',
              'b': 'BKA',
              'e': 'EBA'
          }
      },
      'sanmin': {
          'baseURL': 'https://www.sanmin.com.tw/search/index/?ct={method}&K={key}&ls={sort}&vs=list%20sbs&pi={page}{type}',
          'method': {
              'all': 'K',
              'au': 'AU',
              'pu': 'PU',
              'isbn': 'ISBN',
          },
          'sort': {
              'default': 'SD',
              'dateN2O': 'ED',
              'dateO2N': 'EA',
              'priceH2L': 'PD',
              'priceL2H': 'PA'
          },
          'type': {
              'all': ''
          }
      },
      'kingStone': {
          'baseURL': 'https://www.kingstone.com.tw/search/search?{method}={key}&sort={sort}&dis={type}&page={page}',
          'method': {
              'all': 'q',
              'au': '',
              'pu': '',
              'isbn': '',
          },
          'sort': {
              'default': 'score',
              'dateN2O': 'pu_desc',
              'dateO2N': 'pu_asc',
              'priceH2L': 'pr_desc',
              'priceL2H': 'pr_asc'
          },
          'type': {
              'all': ''
          }
      },
      'eslite': {
          'baseURL': 'https://www.kingstone.com.tw/search/search?{method}={key}&sort={sort}&dis={type}&page={page}',
          'method': {
              'all': 'q',
              'au': '',
              'pu': '',
              'isbn': '',
          },
          'sort': {
              'default': 'score',
              'dateN2O': 'pu_desc',
              'dateO2N': 'pu_asc',
              'priceH2L': 'pr_desc',
              'priceL2H': 'pr_asc'
          },
          'type': {
              'all': ''
          }
      },
  }
  # try:
  data = {}
  choose = resultURL[req_store]
  url = choose['baseURL'].format(
      method=choose['method'][req_method],
      key=urllib.parse.quote(req_key),
      sort=choose['sort'][req_sort],
      page=req_page,
      type=req_type
  )
  soup = get_request_data(method='get', url=url)
  if soup == None:
    a = Book.objects.filter(title__contains=req_key)
    print(a)
    return JsonResponse({})

  else:
    if req_store == 'books':
      data = books.books(soup)
    elif req_store == 'sanmin':
      data = sanmin.sanmin(soup)
    elif req_store == 'kingStone':
      data = kingStone.kingStone(soup)
    return result(request, data, 'mult')
  # except:
  #     print('first step error')
  #     return result(request, {'status': False}, 'mult')


def testIndexSearch(request):
  from .store.product import books, sanmin, kingStone
  # form what store?   # 'books', 'sanmin..
  req_store = request.GET.get('store')
  reqIndex = request.GET.get('index')  # book product link index? # book index
  urls = {
      'books': 'https://www.books.com.tw/products/%s?sloc=main',
      'sanmin': 'https://www.sanmin.com.tw/Product/index/%s',
      'kingStore': 'https://www.kingstone.com.tw/basic/%s?zone=book&lid=search&actid=WISE'
  }
  # try:
  data = {}
  soup = get_request_data(method='get', url=urls[req_store] % reqIndex)
  if req_store == 'books':

    data = books.books(soup, reqIndex)
  elif req_store == 'sanmin':
    data = sanmin.sanmin(soup, reqIndex)
  elif req_store == 'kingStone':
    data = kingStone.kingStone(soup, reqIndex)

  return result(request, data, 'index')
  # except:
  #     return result(request, {'status':False}, 'index')


# def testIndexSearch(request):
#     data = {}
#     with open('E:\Project\FindBook\data.txt', 'r', encoding="utf-8") as fp:
#         data = eval(fp.read())
#     return render(request, "Search/singlePage.html", { 'isUser': request.user.is_authenticated,'data':data })

def searchBooks(request, key, service=None):
  data = []
  # This is save data in DB
  # try:
  #     from users.models import Collect
  #     collectClass = Collect.objects.get(account= request.user.username)
  #     userClass = eval(collectClass.content).keys()
  # except:
  #     userClass= None
  # try:
  #     from .models import Book
  # tmpList = []
  # tmpDataBase = Book.objects.all()
  #     for index, item in enumerate(data):
  # if tmpDataBase.filter(Index= item[-1]).exists():
  #             print('have')
  #         else:
  #             tmpList.append(Book(Img= item[0], Title= item[1], Author= item[2], Publisher= item[3], Date= item[4], Index= item[5]))
  #             # Book(Img= item[0], Title= item[1], Author= item[2], Publisher= item[3], Date= item[4], Index= item[5]).save()

  #             print('save DB')
  #     if tmpList: Book.objects.bulk_create(tmpList)
  # except:
  #     print('save DB ERROR')
  #     pass

  # if service:
  #     print('return data on phone')
  #     return JsonResponse({"data": data})  # return to phone service

  # userClass = None # I don't know what is this
  # return render(   # return to pc service
  #     request,
  #     'Search/cards.html',
  #     {
  #         'isUser': request.user.is_authenticated,
  #         'userKey': key,
  #         'Data':data,
  #         'page':[[i for i in range(1, 5)], 1, 347],
  #         'userClass':userClass
  #     }
  # )

# except:
  # print('Error')
  # return {'message': 'Search failed, pls try again'}


# from urllib.parse import quote,unquote

  # return JsonResponse(

  #     {
  #         "data":[
  #             {
  #                 "imgURL":'https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/52/0010865297.jpg&v=5f16c401&w=180&h=180',
  #                 "title":'This is title',
  #                 "author":'author',
  #                 "publish":'publish',
  #                 "pubDate":'pubDate',
  #                 "index":'index'
  #             },
  #             {
  #                 "imgURL":'https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/27/0010862741.jpg&v=5efb2239&w=180&h=180',
  #                 "title":'This is title2',
  #                 "author":'author2',
  #                 "publish":'publish2',
  #                 "pubDate":'pubDate2',
  #                 "index":'index'
  #             },
  #         ]
  #     }
  # )
def checkTmp(request):
  from .models import StoreAttr
  url = StoreAttr.objects.get(id=1).url
  print(url)
  url = url.format(isbn="this is isbn", title="this title")
  print(url)
  return JsonResponse({'url': url})
