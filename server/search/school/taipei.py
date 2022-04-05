from ..pkg import get_UnivAPI_data


def cust(isbn):
  data = None
  print('cust')
  return {'status': True, 'info': data}


def cute(isbn):
  data = None
  print('cute')
  return {'status': True, 'info': data}


def mcu(isbn):
  data = None
  print('mcu')
  return {'status': True, 'info': data}


def mkc(isbn):
  data = None
  print('mkc')
  return {'status': True, 'info': data}
# 政治


def nccu(isbn):
  url = f"https://nccu.primo.exlibrisgroup.com/primaws/rest/pub/pnxs?blendFacetsSeparately=false&disableCache=false&getMore=0&inst=886NCCU_INST&lang=zh-tw&limit=10&newspapersActive=false&newspapersSearch=false&offset=0&pcAvailability=true&q=isbn,contains,{isbn},AND;rtype,exact,books&qExclude=&qInclude=&rapido=false&refEntryActive=false&rtaLinks=true&scope=MyInstitution&skipDelivery=Y&sort=rank&tab=LibraryCatalog&vid=886NCCU_INST:886NCCU_INST".format(
      isbn=isbn)
  tatus, data = get_UnivAPI_data(url=url)
  print('nccu')
  return {'status': True, 'info': data}


def ntnu(isbn):
  data = None
  print('ntnu')
  return {'status': True, 'info': data}


def ntu(isbn):
  data = None
  print('ntu')
  return {'status': True, 'info': data}


def ntub(isbn):
  data = None
  print('ntub')
  return {'status': True, 'info': data}


def ntue(isbn):
  data = None
  print('ntue')
  return {'status': True, 'info': data}


def ntunhs(isbn):
  data = None
  print('ntunhs')
  return {'status': True, 'info': data}


def ntust(isbn):
  data = None
  print('ntust')
  return {'status': True, 'info': data}


def ntut(isbn):
  data = None
  print('ntut')
  return {'status': True, 'info': data}


def pccu(isbn):
  data = None
  print('pccu')
  return {'status': True, 'info': data}


def scu(isbn):
  data = None
  print('scu')
  return {'status': True, 'info': data}


def shu(isbn):
  data = None
  print('shu')
  return {'status': True, 'info': data}


def takming(isbn):
  data = None
  print('takming')
  return {'status': True, 'info': data}


def tcpa(isbn):
  data = None
  print('tcpa')
  return {'status': True, 'info': data}


def tmu(isbn):
  data = None
  print('tmu')
  return {'status': True, 'info': data}


def tnua(isbn):
  data = None
  print('tnua')
  return {'status': True, 'info': data}


def tpcu(isbn):
  data = None
  print('tpcu')
  return {'status': True, 'info': data}


def ttu(isbn):
  data = None
  print('ttu')
  return {'status': True, 'info': data}


def ukn(isbn):
  data = None
  print('ukn')
  return {'status': True, 'info': data}


def usc(isbn):
  data = None
  print('usc')
  return {'status': True, 'info': data}


def uTaipei(isbn):
  data = None
  print('uTaipei')
  return {'status': True, 'info': data}


def ym(isbn):
  data = None
  print('ym')
  return {'status': True, 'info': data}
