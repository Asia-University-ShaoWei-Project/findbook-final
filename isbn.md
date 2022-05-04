# ISBN API

## ISBN data

1. 9789865501532 - Python 最強入門邁向頂尖高手之路：王者歸來(第二版)全彩版
2. 9789864344017 - Python :期貨演算法交易實務 136 個關鍵技巧詳解
3. 9789864343713 - Python :股票演算法交易實務 145 個關鍵技巧詳解

## Online bookstore

1. 博客來(Books)
   1. URL :
      1. https://search.books.com.tw/search/query/key`/<搜尋編碼>`/cat/`<電子書、圖書>`
         1. 電子書 : `EBA`
         2. 圖書 : `BKA`
   2. 出版社搜尋:
      1. https://search.books.com.tw/search/query/cat/BKA/key/`code`/sort/1/ms2/ms2_1/`adv_pub`/1
   3. 作者:
      1. https://search.books.com.tw/search/query/cat/BKA/key/`code`/sort/1/ms2/ms2_1/`adv_author`/1
2. 三民書店(Sanmin):
   1. URL :
      1. https://www.sanmin.com.tw/search/index/?ct=N&qu=`<搜尋編碼>`&ls=SD 電子書 : 圖書 :
   2. 出版社搜尋:
      1. https://www.sanmin.com.tw/search/index/?ct=PU&qu=`<搜尋編碼>`&ls=SD 作者: https://www.sanmin.com.tw/search/index/?ct=AU&qu=`<搜尋編碼>`&ls=SD ISBN: https://www.sanmin.com.tw/search/index/?ct=ISBN&qu=`<搜尋編碼>`&ls=SD
3. 誠品書局:
   1. 出版社搜尋: http://www.eslite.com/Search_BW.aspx?query=`code`&searchType=4
   2. 作者: X ISBN: http://www.eslite.com/Search_BW.aspx?query=`<搜尋編碼>`&searchType=5

---

## 大學圖書館

1. 中正
   1. 有資料
      1. 先取得到 setno code 再取得 API
      2. http://webpac.lib.ccu.edu.tw:8888/api/chi/find/TOP02/ISBN=9789864344017%20AND%20WFM=(BK%20or%20EB) {“setno”:“001391”,“records”:“000000001”,“entries”:“000000001”} http://webpac.lib.ccu.edu.tw:8888/api/chi/fetch/001381/1/20
   2. 沒資料
      1. {“setno”:“0”,“records”:“0”,“entries”:“0”}
      2. http://webpac.lib.ccu.edu.tw:8888/api/chi/find/TOP02/ISBN=9789865024864%20AND%20WFM=(BK%20or%20EB)
2. 靜宜
   1. 有資料
      1. XML
      2. http://webpac.lib.pu.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863477310&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. http://webpac.lib.pu.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864344017&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
3. 龍華科技
   1. 有資料
      1. 您沒有權限使用『queryBibliographic』ＡＰＩ功能！《web 查詢時》 > > > cookie : JSESSIONID=1426580AE988F21C69F51F270571A19B
      2. http://140.131.19.224/inspireapp/APIidentify=claridy&func=queryBibliographic&condition=3&input=9789864344017&locationId=&start=0&limit=10&sb=relevance&ob=desc&t=0.4821370751155847&package_name_data=H55DEBA26
   2. 沒資料
      1. []
      2. http://140.131.19.224/inspireapp/API?identify=claridy&func=queryBibliographic&condition=3&input=9789865501532&locationId=&start=0&limit=10&sb=relevance&ob=desc&t=0.7547611303496287&package_name_data=H55DEBA26
4. . 東海
   1. 有資料
      1. XML
      2. http://140.128.103.234/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864344017&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. XML
      2. 可能要找特定 exist http://140.128.103.234/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
5. . 南華
   1. 有資料
      1. XML
      2. http://hylib.nhu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. XML
      2. not book information
      3. http://hylib.nhu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
6. 中國科技
   1. 有資料
      1. XML
      2. http://hylib.lib.cute.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. XML
      2. http://hylib.lib.cute.edu.tw/webpac/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
7. .佛光
   1. 有資料
      1. XML
      2. http://libils.fgu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789864341658&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. XML
      2. http://libils.fgu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
8. 長庚醫院

   1. 有資料
      1. XML http://118.163.223.8/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50

   - 沒資料 > XML http://118.163.223.8/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50

9. 城大
   1. 有資料
      1. XML
      2. http://202.175.78.188/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863797227&parameter=field:ISBN&parameter=nowpage:1&parameter=pagesize:50
   2. 沒資料
      1. XML
      2. http://202.175.78.188/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9578247354&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
10. 遠東科技

    1. 有資料
       1. XML
       2. http://hy.lib.feu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863125235&parameter=field:ISBN&parameter=keepsite:001&parameter=nowpage:1&parameter=pagesize:50
    2. 沒資料
       1. XML
       2. http://hy.lib.feu.edu.tw/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863797227&parameter=field:ISBN&parameter=keepsite:001&parameter=nowpage:1&parameter=pagesize:50

11. 育達科技
    1. 有資料
       1. XML
       2. http://120.106.11.155/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789863125235&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
    2. 沒資料
       1. XML
       2. http://120.106.11.155/apiServiceV2.do?method=BookSearchModel:BookQuery&parameter=input:9789865501532&parameter=field:ISBN&parameter=keepsite:ALL&parameter=nowpage:1&parameter=pagesize:50
