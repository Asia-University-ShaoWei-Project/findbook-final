# 國立師範大學
from packets.getHtml import getHtml

def ntnu(key):

	soup = getHtml('post', 'https://www.lib.ntnu.edu.tw/holding/doQuickSearch.jsp', data= {'newQuery':'true','param':'/search*cht/','searchtype':'i','searcharg':key,'SORT':'D','extended':'0'})
	table = soup.find('div',class_='content').find('table',class_='')
	
	trs= table.find_all('tr')[1:]
	NtnuData = []
	# ['館藏地','索書號','條碼','處理狀態','']
	# Example :
		# [['公館分館6F新類號專區', '312.32P999 8649', 'BM0706190', '到期 06-27-20', '預約此書'], 
		# ['林口分館2F新類號專區', '312.33P999 8649 2016', 'BM0712015', '到期 09-26-20', '預約此書'],
		# ['總館6F新類號專區', '312.33P999 8649 2016', 'BM0718516', '到期 08-03-20', '預約此書']]
	for tr in trs:
		NtnuData.append([td.text.replace('\n', '').replace('\xa0', '') for td in tr.find_all('td')])
	return {'has':True, 'data': NtnuData}

	# return {'has':False}