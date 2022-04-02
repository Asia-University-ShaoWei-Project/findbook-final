from packages.package import get_UnivAPI_data
def cgu(isbn):
  data = None
  print('cgu')
  return {'status': True,'info': data}
def cgust(isbn):
  data = None
  print('cgust')
  return {'status': True,'info': data}
def cycu(isbn):
  data = None
  print('cycu')
  return {'status': True,'info': data}
def hsc(isbn):
  data = None
  print('hsc')
  return {'status': True,'info': data}
def knu(isbn):
  data = None
  print('knu')
  return {'status': True,'info': data}
def lhu(isbn):
  data = None
  print('lhu')
  return {'status': True,'info': data}
def nanya(isbn):
  data = None
  print('nanya')
  return {'status': True,'info': data}
def ncu(isbn):
  data = None
  print('ncu')
  return {'status': True,'info': data}
def ntsu(isbn):
  data = None
  print('ntsu')
  return {'status': True,'info': data}
def uch(isbn):
  data = None
  print('uch')
  return {'status': True,'info': data}
def vnu(isbn):
  data = None
  print('vnu')
  return {'status': True,'info': data}
def yzu(isbn):
  url = "https://libx.yzu.edu.tw/LibAPI21/api/Catalogs/QueryCatalog/BK/ISBN/{isbn}".format(isbn=isbn)
  # url_code = 'https://libx.yzu.edu.tw/LibAPI21/api/Catalogs/GetBiblioList/{code}/zh'.format(code=1234)
  status, data = get_UnivAPI_data(url=url)
  print('yzu')
  return {'status': True,'info': data}
