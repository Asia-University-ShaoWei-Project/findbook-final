from ..pkg import get_UnivAPI_data
# 中正


def ccu(isbn):
  data = None
  url = 'http://webpac.lib.ccu.edu.tw:8888/api/chi/find/TOP02/ISBN={isbn}%20AND%20WFM=(BK%20or%20EB)'.format(
      isbn=isbn)
  tmp = get_UnivAPI_data(isAPI=True, url=url)
  # --- url2 ---
  if tmp['status'] and ('setno' in tmp['json_data']):
    url = 'http://webpac.lib.ccu.edu.tw:8888/api/chi/fetch/{code}/1/20'.format(
        code=tmp['json_data']['setno'])
    tmp = get_UnivAPI_data(isAPI=True, url=url)
    data = True if tmp['status'] else False
  else:
    data = {'status': False, 'data': False}
  return {'status': True, 'info': data}


def cjc(isbn):
  data = None
  print('cjc')
  return {'status': True, 'info': data}


def ncyu(isbn):
  data = None
  print('ncyu')
  return {'status': True, 'info': data}


def nhu(isbn):
  data = None
  print('nhu')
  return {'status': True, 'info': data}


def toko(isbn):
  data = None
  print('toko')
  return {'status': True, 'info': data}


def ttc(isbn):
  data = None
  print('ttc')
  return {'status': True, 'info': data}


def wfu(isbn):
  data = None
  print('wfu')
  return {'status': True, 'info': data}
