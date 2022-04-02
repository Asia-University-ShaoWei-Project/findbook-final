from packets.getHtml import getHtml
def nknu(key):
	url = 'https://nknulib.nknu.edu.tw/search*cht/?searchtype=i&searcharg={}&sortdropdown=t&SUBMIT='.format(key)
	soup = getHtml(type='get', url=url)
	if soup not None:
		NknuData = []
		for tr in soup.findAll('tr',class_='bibItemsEntry'):
			NknuData.append([td.text.replace('\n', '').replace('\xa0', '') for td in tr.find_all('td')])
		return {'has':True,'data':NknuData}
	else:
		return {'alert':'oh! server is error'}