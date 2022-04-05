# ISBN data

test-ISBN = 9787113257804

# Books

URL : https://search.books.com.tw/search/query/key/<搜尋編碼>/cat/<電子書、圖書> 電子書 : EBA 圖書 : BKA

1. 出版社搜尋: https://search.books.com.tw/search/query/cat/BKA/key/`code`/sort/1/ms2/ms2_1/adv_pub/1
2. 作者: https://search.books.com.tw/search/query/cat/BKA/key/`code`/sort/1/ms2/ms2_1/adv_author/1

三民書店(Sanmin): URL : https://www.sanmin.com.tw/search/index/?ct=N&qu=<搜尋編碼>&ls=SD 電子書 : 圖書 :

出版社搜尋: https://www.sanmin.com.tw/search/index/?ct=PU&qu=<搜尋編碼>&ls=SD 作者: https://www.sanmin.com.tw/search/index/?ct=AU&qu=<搜尋編碼>&ls=SD ISBN: https://www.sanmin.com.tw/search/index/?ct=ISBN&qu=<搜尋編碼>&ls=SD

誠品書局: URL : 電子書 : 圖書 :

出版社搜尋: http://www.eslite.com/Search_BW.aspx?query=`code`&searchType=4 作者: X ISBN: http://www.eslite.com/Search_BW.aspx?query=<搜尋編碼>&searchType=5

---

**ISBN data**

1. 9789865501532 - Python 最強入門邁向頂尖高手之路：王者歸來(第二版)全彩版
2. 9789864344017 - Python :期貨演算法交易實務 136 個關鍵技巧詳解
3. 9789864343713 - Python :股票演算法交易實務 145 個關鍵技巧詳解

---

- 1. 中正
    - 有資料
        
        > 先取得到 setno code 再取得 API http://webpac.lib.ccu.edu.tw:8888/api/chi/find/TOP02/ISBN=9789864344017%20AND%20WFM=(BK%20or%20EB) {“setno”:“001391”,“records”:“000000001”,“entries”:“000000001”} http://webpac.lib.ccu.edu.tw:8888/api/chi/fetch/001381/1/20
        > 
    - 沒資料
        
        > {“setno”:“0”,“records”:“0”,“entries”:“0”} http://webpac.lib.ccu.edu.tw:8888/api/chi/find/TOP02/ISBN=9789865024864%20AND%20WFM=(BK%20or%20EB)
        > 
- 2. 靜宜
    - 有資料
        
        > XML http://webpac.lib.pu.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863477310&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > commend http://webpac.lib.pu.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864344017&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
- 3. 龍華科技
    - 有資料
        
        > 您沒有權限使用『queryBibliographic』ＡＰＩ功能！《web 查詢時》
        > 
        > 
        > > cookie : JSESSIONID=1426580AE988F21C69F51F270571A19B http://140.131.19.224/inspireapp/API?identify=claridy&func=queryBibliographic&condition=3&input=9789864344017&locationId=&start=0&limit=10&sb=relevance&ob=desc&t=0.4821370751155847&package_name_data=H55DEBA26
        > > 
    - 沒資料
        
        > []
        > 
        > 
        > > http://140.131.19.224/inspireapp/API?identify=claridy&func=queryBibliographic&condition=3&input=9789865501532&locationId=&start=0&limit=10&sb=relevance&ob=desc&t=0.7547611303496287&package_name_data=H55DEBA26
        > > 
- . 東海
    - 有資料
        
        > XML http://140.128.103.234/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864344017&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML 可能要找特定 exist http://140.128.103.234/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 南華
    - 有資料
        
        > XML http://hylib.nhu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML, not book information http://hylib.nhu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 中國科技
    - 有資料
        
        > XML http://hylib.lib.cute.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://hylib.lib.cute.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 佛光
    - 有資料
        
        > XML http://libils.fgu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864341658&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://libils.fgu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 長庚醫院
    - 有資料
        
        > XML http://118.163.223.8/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://118.163.223.8/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 城大
    - 有資料
        
        > XML http://202.175.78.188/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863797227&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://202.175.78.188/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 遠東科技
    - 有資料
        
        > XML http://hy.lib.feu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863125235&parameter=field:ISBN&parameter=keepsite:001&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://hy.lib.feu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863797227&parameter=field:ISBN&parameter=keepsite:001&parameter=nowpage:1&parameter=pagesize:50
        > 
- . 育達科技
    - 有資料
        
        > XML http://120.106.11.155/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863125235&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        > 
    - 沒資料
        
        > XML http://120.106.11.155/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
        >