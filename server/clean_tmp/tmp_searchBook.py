

def indexSearch(request, key):
  # search DB has index
  print('into indexSearch')
  from .models import Book
  try:
    book = Book.objects.get(Index=key)
    data = {
        'src': book.Img,
        'title': book.Title,
        'isbn': book.ISBN_10+'\t'+book.ISBN_13,
        'author': book.Author,
        'publisher': book.Publisher,
        'date': book.Date,
        'content': book.Content
    }
    print('has data')
    return render(request, "Search/singlePage.html",
                  {'isUser': request.user.is_authenticated, 'data': ["DB", data]})
  except:
    url = 'https://www.books.com.tw/products/%s?sloc=main' % key
    #     'https://www.books.com.tw/products/0010860653?sloc=main'
    soup = get_request_data(method='get', url=url)
    print('取得連結')
    if bool(soup):
      ISBN10 = ''
      ISBN13 = ''
      price = ''
      titles = []
      try:
        info = soup.find('meta', {'name': 'description'})['content']
        tmpTag = {'書名': 'title', '語言': 'lang', 'ISBN': 'isbn', '頁數': 'page',
                  '出版社': 'pub', '作者': 'author', '譯者': 'Translator', '出版日期': 'date', '類別': 'class'}
        tag = {'title': 0, 'lang': 1, 'isbn': 2, 'page': 3, 'pub': 4,
               'author': 5, 'Translator': 6, 'date': 7, 'class': 8}
        tagData = [None for i in range(9)]
        for i in info.split('，'):
          tmp = i.split('：')
          tagData[tag[tmpTag[tmp[0]]]] = tmp[1]
        print('INFO 處理完成')
        # ISBN
        ISBN10 = None if len(tagData[2]) == 13 else tagData[2]
        ISBN13 = tagData[2] if len(tagData[2]) == 13 else None

        price = soup.find('strong', class_='price01').text

        # Content
        html = soup.find('div', class_="grid_19")  # grid_19 alpha
        titles = []
        bookInfo = {'content': []}
        html = html.findAll('div', class_='mod_b type02_m057 clearfix')
        contents = [[] for i in range(len(html))]
        for index, content in enumerate(html):
          titles.append(content.find('h3').string)
          for j in content.find('div', class_='content').contents:
            #         print(len(j.string))
            if j.name != 'br':
              if (j.string != None) and (len(j.string) > 1):
                contents[index].append(str(j).strip())
            else:
              contents[index].append(str(j).strip())
        print('return')
        # print({'data':["s", [tagData, [titles, contents], price]]})
        with open('E:\Project\FindBook\data.txt', 'w', encoding="utf-8") as fp:
          fp.write(
              str({'data': ["s", [tagData, [titles, contents], price]]}))
          # fp.write('sdfsdf')

        return render(request, "Search/singlePage.html",
                      {'isUser': request.user.is_authenticated,
                       'data': ["s", [tagData, [titles, contents],
                                      price]]})
      except:
        print([tagData, ISBN10, ISBN13, titles, price])
        return JsonResponse({'message': 'ERROR'})
