from packets.getHtml import getHtml
def ltu(key):
    	print('into 嶺東')
	soup = getHtml('get', 'http://192.192.100.39/toread/opac/search?q={}&max=&view=CONTENT&level=all&material_type=all&location='.format(key))
	soup = soup.body.find('div', id='resultZ')
	if soup is None:
		return {'has':False}
	else:
		getKey = soup.find('div', id='results').ul.li.find('div', class_='img_reslt').a['href'].split(';jsessionid')[0].split('bibliographic_view/')[-1]
	#     getKey=soup.find('a', id='MyPageLink_7')['href'].split(';jsessionid')[0].split('bibliographic_view/')[-1]

		soup = getHtml('get', 'http://192.192.100.39/toread/opac/bibliographic_view/{}?q={}'.format(getKey, key))

		data = soup.find('div', id='contentBody').form.find('div', id='items').findAll('tr', class_='gridTr')
		LtuData = [[] for i in range(len(data))] #資料儲存
		for index, itemsTr in enumerate(data):
			for itemsTd in itemsTr.findAll('td', class_='gridTd'):
				tmp = itemsTd.string
				if tmp:
					LtuData[index].append(tmp.strip())
		return {'has':True,'data':LtuData}