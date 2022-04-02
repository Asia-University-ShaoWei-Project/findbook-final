def csu(soup):
  data = None
  print('csu')
  return {'status': True,'info': data}
def fotech(soup):
  data = None
  print('fotech')
  return {'status': True,'info': data}
def fy(soup):
  data = None
  print('fy')
  return {'status': True,'info': data}
def isu(soup):
  data = None
  print('isu')
  return {'status': True,'info': data}
def kmu(soup):
  data = None
  print('kmu')
  return {'status': True,'info': data}
def kyu(soup):
  data = None
  print('kyu')
  return {'status': True,'info': data}
def nknu(soup): # 國立高雄師範大學
  data = None
  url = 'https://nknulib.nknu.edu.tw/search*cht/?searchtype=i&searcharg={}&sortdropdown=t&SUBMIT='.format(key)
	soup = getHtml(type='get', url=url)
	if soup not None:
		NknuData = []
		for tr in soup.findAll('tr',class_='bibItemsEntry'):
			NknuData.append([td.text.replace('\n', '').replace('\xa0', '') for td in tr.find_all('td')])
		return {'status':True,'data':NknuData}
	else:
		return {'alert':'oh! server is error'}
  print('nknu')
  return {'status': True,'info': data}
def nkuht(soup):
  data = None
  print('nkuht')
  return {'status': True,'info': data}
def nkust(soup):
  data = None
  print('nkust')
  return {'status': True,'info': data}
def nsysu(soup):
  data = None
  print('nsysu')
  return {'status': True,'info': data}
def nuk(soup):
  data = None
  print('nuk')
  return {'status': True,'info': data}
def stu(soup):
  data = None
  print('stu')
  return {'status': True,'info': data}
def szmc(soup):
  data = None
  print('szmc')
  return {'status': True,'info': data}
def tf(soup):
  data = None
  print('tf')
  return {'status': True,'info': data}
def wzu(soup):
  data = None
  print('wzu')
  return {'status': True,'info': data}
def yuhing(soup):
  data = None
  print('yuhing')
  return {'status': True,'info': data}
