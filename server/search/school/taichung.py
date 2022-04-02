from packages.package import get_UnivAPI_data, api_result_data


def asia(isbn):
    print('-> 亞大')
    '''
    ##### example URL :
    + Count(0) : http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=3&input=9789865423116&locationId=303&start=0&limit=1&sb=relevance&ob=desc
    + Count(1) : http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=3&input=9789865423117&locationId=303&start=0&limit=1&sb=relevance&ob=desc
    + Count(3) : http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=3&input=9789863477310&locationId=303&start=0&limit=1&sb=relevance&ob=desc
    + Data length always one information, except empty data(0) 
    '''
    url = "http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=3&input={isbn}&locationId=303&start=0&limit=1&sb=relevance&ob=desc".format(
        isbn=isbn)
    result = []
    status, data = get_UnivAPI_data(url=url)
    exist = False if len(data) == 0 else True
    if status and exist:
        info = data[0]
        result.append(
            {
                'id': info['mId'],
                'count':info['itemCount'],
                'type':0 if "書目" in info['recordType'] else 1,
            }
        )
        # result.append(api_result_data(
        #     id=info['mId'],
        #     count=info['itemCount'],
        #     type=0 if "書目" in info['recordType'] else 1,
        # ) if exist else {})
    return {'status': status, 'info': result}


def cmu(isbn):
    result = None
    print('cmu')
    return {'status': True, 'info': result}

# 中山醫大


def csmu(isbn):
    print('-> 中山醫大')
    url = "http://140.128.138.208/webpac/msearchapi/{isbn}/1".format(isbn=isbn)
    result = {'base': None, 'info': []}
    status, data = get_UnivAPI_data(url=url)
    exist = False if len(data['results']) == 0 else True
    if status and exist:  # connect status and data is exist?
        print('into')
        info = data['results']
        print('process base')
        result['base'] = {
            'count': data['total']
        }
        for i in info:
            result['info'].append({
                'id': i['id'],
                'index': i['docid'],
                'type': 1 if "電子書" in i['type'] else 0,  
            })
        # result['base'] = api_result_data(
        #     select=0,
        #     count=data['total']
        # )
        # print('process base')
        # for i in info:
        #     result['info'].append(api_result_data(
        #         select=1,
        #         id=i['id'] if 'id' in i else None,
        #         index=i['docid'] if 'docid' in i else None,
        #         # count=i['total'] if 'total' in i else None,
        #         type=1 if "電子書" in i['type'] else 0,
        #     ) if exist else {})
    return {'status': status, 'info': result}


def ctust(isbn):
    result = None
    print('ctust')
    return {'status': True, 'info': result}


def cyut(isbn):
    result = None
    print('cyut')
    return {'status': True, 'info': result}


def fcu(isbn):
    result = None
    print('fcu')
    return {'status': True, 'info': result}


def hk(isbn):
    result = None
    print('hk')
    return {'status': True, 'info': result}


def hust(isbn):
    result = None
    print('hust')
    return {'status': True, 'info': result}


def ltu(isbn):
    result = None
    print('ltu')
    return {'status': True, 'info': result}


def nchu(isbn):
    result = None
    print('nchu')
    return {'status': True, 'info': result}


def ncut(isbn):
    result = None
    print('ncut')
    return {'status': True, 'info': result}


def ntcu(isbn):
    result = None
    print('ntcu')
    return {'status': True, 'info': result}


def ntupes(isbn):
    result = None
    print('ntupes')
    return {'status': True, 'info': result}


def nutc(isbn):
    result = None
    print('nutc')
    return {'status': True, 'info': result}


def ocu(isbn):
    result = None
    print('ocu')
    return {'status': True, 'info': result}


def pu(isbn):
    result = None
    print('pu')
    return {'status': True, 'info': result}


def thu(isbn):
    result = None
    print('thu')
    return {'status': True, 'info': result}
