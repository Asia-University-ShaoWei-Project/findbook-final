from django.core.serializers import serialize
from searchBook.models import IndexBooks, IndexEslite, IndexSanmin, IndexKingStone
def index_filter(rq_store='books', item_indexs=[]):
    num_list = []
    resoult_data = []
    find_indexModel = None

    # item_indexs = ['1730', '1407', '1881', '1155', '1899', '1892', '1371', '1620', '1398', '1991']

    if rq_store=='books':
        find_indexModel = IndexBooks.objects.filter(index__in = item_indexs)
    elif rq_store=='sanmin':
        find_indexModel = IndexSanmin.objects.filter(index__in = item_indexs)
    elif rq_store=='kingStone':
        find_indexModel = IndexKingStone.objects.filter(index__in = item_indexs)
    elif rq_store=='eslite':
        find_indexModel = IndexEslite.objects.filter(index__in = item_indexs)
        
    for i in range(len(item_indexs)):
        num_list.append(i)
        resoult_data.append(None)

    for i in find_indexModel:
        tmp_index = item_indexs.index(i.index)
        num_list.remove(tmp_index)
        # resoult_data[tmp_index] = serialize('json', i.book) # should be to product
        tmp_book = i.book
        resoult_data[tmp_index] = {
            'exist':tmp_book.exist,
            'index':tmp_book.index[rq_store],
            'imgURL':tmp_book.img_url[rq_store],
            'title':tmp_book.title,
            'price':tmp_book.price[rq_store],
            'date':tmp_book.date,
            'author':tmp_book.author,
            'pub':tmp_book.publisher
        }
    
    return num_list, resoult_data