from isbnlib import canonical, is_isbn10, is_isbn13

def checkISBN(ISBN):
    if (len(ISBN) == 10) and is_isbn10(ISBN):
        return [True, 10]
    elif (len(ISBN) == 13) and is_isbn13(ISBN):
        return [True, 13]
    else:
        return [False, None]