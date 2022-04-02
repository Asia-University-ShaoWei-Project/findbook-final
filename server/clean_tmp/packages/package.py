# import urllib.parse


def checkISBN(ISBN):
    from isbnlib import is_isbn10, is_isbn13
    if (len(ISBN) == 10) and is_isbn10(ISBN):
        return [True, 10]
    elif (len(ISBN) == 13) and is_isbn13(ISBN):
        return [True, 13]
    else:
        return [False, None]


def get_request_data(getSoup=True, method='get', url='', params=None, data=None, encoding='utf-8'):
    '''
    + Used BeautifulSoup get websit html if getSoup is True.\n
    ```py
    if req.status_code == 200:
        if getSoup: return BeautifulSoup(req.text, 'html.parser')
        return req # get api
    ```
    '''
    from bs4 import BeautifulSoup
    from fake_useragent import UserAgent
    import requests
    # import requests_async as requests
    # import asyncio
    try:
        print('ready requests')
        # default_headers = {'user-agent':"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"}
        # req = requests.request(req_type, url, data)
        headers = {'user-agent': str(UserAgent().random)}
        req = None
        if method == 'get':
            req = requests.get(url, headers=headers, params=params)
        elif method == 'post':
            req = requests.post(url, headers=headers, data=data)

        # req=requests.get(url, headers= headers, params= params)
        if req.status_code == 200:
            print('requests success.')
            req.encoding = encoding
            if getSoup:
                return BeautifulSoup(req.text, 'html.parser')
            return req

        print('requests not 200, code : ', req.status_code)
        return None
    except:
        return None

# data = get_data(school_func=yunlin, req_key=req_key, req_city=req_city, req_school=req_school)

# async def getHtml(method, url, params= None, data= None, encoding= 'utf-8'):

#     # headers = {'user-agent':"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"}
#     # req = requests.request(req_type, url, data)
#     if method == 'get':
#         req = await requests.get(url, headers= {'user-agent':str(UserAgent().random)}, params= params)
#     elif method == 'post':
#         req = await requests.post(url, headers= {'user-agent':str(UserAgent().random)}, data= data)

#     # req=requests.get(url, headers= headers, params= params)
#     if req.status_code == 200:
#         print('requests -> 200')
#         req.encoding = encoding
#         return BeautifulSoup(req.text, 'html.parser')
#     else:
#         print('requests -> ', req.status_code)
#         return None

# def textClean(splitChar='', text='', loop=1, reRight=True, notReverse = True): #
#     myIndex = 1 if notReverse else 0
#     myLoop = 0
#     myRange = text if notReverse else reversed(text)
#     for i in myRange:
#         if i == splitChar:
#             myLoop+=1
#             if myLoop==loop:
#                 if reRight:
#                     return text[myIndex:] if notReverse else text[-myIndex:] # 由index至右
#                 return text[:myIndex] if notReverse else text[:-myIndex] # 由左至index
#         myIndex+=1


def get_UnivAPI_data(url=None):
    '''
    + Get university library api data.\n
    ```py
    return {'status':`bool`, 'json_data':<dict>}
    ```
    '''
    status = False
    result = {}

    # None || request data
    response = get_request_data(method='get', url=url, getSoup=False) if url != None else None
    if response != None:  # if request 200
        status = True
        result = response.json()  # get request data
    return status, result


def api_result_data(**kwargs):
    
    def key_exist(key):
        return kwargs[key] if key in kwargs else None
    if kwargs['select'] == 0: # base
        return {
            'count': key_exist['count'],
        }
    elif kwargs['select'] == 1: # info
        return {
            'info': {
                'id': key_exist['id'],
                'index': key_exist['index'],
                # 'count': key_exist['count'],
                'type': key_exist['type'],
                # 'index':	key_exist['index'],
            }
        }


# def url_info(url):
#     '''
#     + Get URL information.\n
#     ```py
#     return query
#     ```
#     '''
#     result = urllib.parse.urlsplit(url)
#     query = dict(urllib.parse.parse_qsl(urllib.parse.urlsplit(url).query))
#     ip = urllib.parse.urlsplit(url).netloc
#     path = urllib.parse.urlsplit(url).path
#     new_url = urllib.parse.urlparse(url)
#     print('第一、urllib.parse.urlsplit(url)=', result)
#     print('ip或者域名=', ip)
#     print('ip或者域名=', new_url.netloc)
#     print('path路径=', path)
#     return query

def textClean(splitChar='', text='', loop=1, reRight=True, notReverse = True): #
    myIndex = 1 if notReverse else 0
    myLoop = 0
    myRange = text if notReverse else reversed(text)
    for i in myRange:
        if i == splitChar: 
            myLoop+=1
            if myLoop==loop: 
                if reRight:
                    return text[myIndex:] if notReverse else text[-myIndex:] # 由index至右
                return text[:myIndex] if notReverse else text[:-myIndex] # 由左至index
        myIndex+=1