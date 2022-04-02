from packets.getHtml import getHtml
def asia(key):
    print('亞大學校')
    ResponseData = {}
	soup = getHtml(method = 'get', url = 'http://aulib.asia.edu.tw/webpac/search.cfm',
	 params= {'m':'ss','k0':key,'t0':'k','c0':'and'})
	if bool(soup):  #如果沒有編號則沒此書
		url = soup.find('a', id="autolink")['href']
		soup = getHtml('get', 'http://aulib.asia.edu.tw/webpac/'+url)
		html = soup.find(class_='list list_border')
		if html: #進入 但館藏0本
			html = html.find_all('tbody')

			
			count = len(html) #幾本書
			AsiaData = [[0]*6 for _ in range(count)] #傳遞data
			tmp = [0]*11 #暫時data
			condition = {'仍':0,'借':1,'計':2}
			# 資料量縮小改變
			for i in range(0,count):  #資料縮小迴圈
				for j,item in enumerate(html[i].find_all('td')):
					tmp[j] = item.text.strip()
				AsiaData[i][0] = tmp[2] #索引(0)
				AsiaData[i][1] = tmp[1] #館藏地(1)
				
				if len(tmp[3].split()) == 1:  
					AsiaData[i][2] = condition[tmp[3][0]]#館藏狀態(2)-
				else: 
					AsiaData[i][2] = condition[tmp[3][0]],' '+tmp[3].split()[1] #-

				if html[i].find(class_='tooltip') == None: 
					AsiaData[i][3] = 0 #有無附件(3)
				else: 
					AsiaData[i][3] = 1
				AsiaData[i][4] = tmp[8] #預約人數(4)
				AsiaData[i][5] = 1 if tmp[9][0] == '1' else 0  #類別(0:不可，1:可借)(5)
			print(AsiaData)
			return {'has':True, 'data':AsiaData}
		else:
			return {'has': False}
	else:
		return {'has': False}