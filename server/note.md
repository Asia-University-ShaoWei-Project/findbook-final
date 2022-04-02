- other
  [「專題、畢業專題、大學專題」英文是什麼？](https://english.cool/independent-study/)
- django-admin

```bash
pip install django-user-agents
pip install fake-useragent
pip install beautifulsoup4
pip install django-jsonfield

pip install djangorestframework
pip install markdown       # Markdown support for the browsable API.
pip install django-filter  # Filtering support
```

- django request

```py
if request.user.is_authenticated:
.body)# b''
.scheme # http
.path # /test/Http/
.path_info # /test/Http/
.method # GET
.encoding # None
.content_type # text/plain
.content_params # {}
.headers # {'Content-Length': '', 'Content-Type': 'text/plain', 'Host': '127.0.0.1:8000', 'Connection': 'keep-alive', 'Cache-Control': 'max-age=0', 'Upgrade-Insecure-Requests': '1', 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Appl
```

- api.txt
  http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=1&input=Python&locationId=&start=0&limit=10&sb=relevance&ob=desc
  http://120.108.102.23/
  inspireapp/API?
  identify=AUL&
  func=queryBibliographic&
  condition=1&
  input=Python&
  locationId=&
  start=0&
  limit=10&
  sb=relevance&
  ob=desc
  9789865501532
  condition=1& ()

- buildURL.txt

```json
{
  "baseURL": {
    "books": "https://search.books.com.tw/search/query/cat/{book}/key/{key}/sort/{sort}/{method}page/{page}/v/0/",
    "sanmin": "https://www.sanmin.com.tw/search/index/?ct={method}&K={key}&ls={sort}&vs=list%20sbs&pi={page}",
    "kingStone": "https://www.kingstone.com.tw/search/search?{method}={key}&sort={sort}&dis={book}&page={page}"
  },
  "method": {
    "all": {
      "books": "",
      "sanmin": "K",
      "kingStone": "q"
    },
    "au": {
      "books": "adv_author/1/",
      "sanmin": "AU",
      "kingStone": ""
    },
    "pu": {
      "books": "adv_pub/1/ms2/ms2_1/",
      "sanmin": "PU",
      "kingStone": ""
    },
    "isbn": {
      "books": "",
      "sanmin": "ISBN",
      "kingStone": ""
    }
  },
  "sort": {
    "default": {
      "books": "1",
      "sanmin": "SD",
      "kingStone": "score"
    },
    "dateN2O": {
      "books": "5",
      "sanmin": "ED",
      "kingStone": "pu_desc"
    },
    "dateO2N": {
      "books": "6",
      "sanmin": "EA",
      "kingStone": "pu_asc"
    },
    "priceH2L": {
      "books": "7",
      "sanmin": "PD",
      "kingStone": "pr_desc"
    },
    "priceL2H": {
      "books": "8",
      "sanmin": "PA",
      "kingStone": "pr_asc"
    }
  },
  "type": {
    "all": {
      "books": "all",
      "sanmin": "",
      "kingStone": ""
    },
    "b": {
      "books": "BKA",
      "sanmin": "",
      "kingStone": ""
    },
    "e": {
      "books": "EBA",
      "sanmin": "",
      "kingStone": ""
    }
  }
}
```
