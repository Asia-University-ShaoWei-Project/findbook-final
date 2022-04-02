from packages.package import get_request_data, textClean
from searchBook.models import IndexKingStone


def kingStone(soup, book_index):
    intrData = []
    infoData = {['title', 'price', 'date', 'pub', 'author',
                 'isbn', 'page', ][i]: None for i in range(7)}
    try:
        return {
            'status': True,
            'info': [],
        }
    except:
        return {
            'status': False,
        }
