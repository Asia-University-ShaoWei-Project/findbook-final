from .models import IndexSanmin, IndexEslite, IndexKingStone, IndexBooks
from .models import Book
from .models import Collect, Profile
from django.contrib import admin

# Register your models here.
# TODO polls admin
from django.contrib import admin
from .models import Top
# from .models import Books, UniversityName


class TopAdmin(admin.ModelAdmin):
  list_display = ('img_url',)

  list_filter = ('isbn',)


admin.site.register(Top, TopAdmin)

# admin.site.register(Books)
# admin.site.register(UniversityName)
# admin.site.register(BookInstance)
# TODO users


class CollectAdmin(admin.ModelAdmin):
  # list_display=('isbn','name','price')
  list_display = ('account',)
  list_filter = ('account',)


admin.site.register(Collect, CollectAdmin)
admin.site.register(Profile)
# admin.site.register(Profile_tmp)
# TODO: searchBook


class BookAdmin(admin.ModelAdmin):
  # list_display=('isbn','name','price')
  list_display = ('ISBN_13',)
  list_filter = ('index',)


class IndexAdmin(admin.ModelAdmin):
  list_display = ('index',)
  list_filter = ('index',)


admin.site.register(Book)
admin.site.register(IndexBooks, IndexAdmin)
admin.site.register(IndexSanmin, IndexAdmin)
admin.site.register(IndexEslite, IndexAdmin)
admin.site.register(IndexKingStone, IndexAdmin)

# class StoreAttrAdmin(admin.ModelAdmin):
#     # list_display=('isbn','name','price')
#     list_display= ('url',)
#     list_filter = ('url',)

# admin.site.register(StoreAttr, StoreAttrAdmin)


# add eslite index data

# indexModel_list = []
# buildBook_list = []
# for i in data:
#     tmp_data = data[i]
#     tmp = Book.objects.filter(title=tmp_data['title'])
#     if len(tmp)!=0: # 有此資料並更新資料
#         tmp = tmp[0]
#         tmp.index['eslite'] = i
#         tmp.exist['eslite'] = True
#         tmp.img_url['eslite'] = tmp_data['imgURL']
#         tmp.price['eslite'] = tmp_data['price']
#         tmp.save()
#         indexModel_list.append(IndexEslite(index=i, book=tmp))
#     else:
#         tmp_build_book = Book(
#             index={'books':None,'sanmin':None,'kingstone':None,'eslite':i,},
#             title=tmp_data['title'],
#             img_url={'books':None,'sanmin':None,'kingstone':None,'eslite':tmp_data['imgURL'],},
#             exist={'books':None,'sanmin':None,'kingstone':None,'eslite':True,},
#             date=tmp_data['date'],
#             author=tmp_data['author'],
#             publisher=tmp_data['pub'],
#             price={'books':None,'sanmin':None,'kingstone':None,'eslite':tmp_data['price'],},
#         )
#         buildBook_list.append(tmp_build_book)

# if len(buildBook_list)>0:
#     Book.objects.bulk_create(buildBook_list)
# if len(indexModel_list)>0:
#     IndexEslite.objects.bulk_create(indexModel_list)


# indexModel_list = []
# count = 0
# for i in data:
#     tmp_data = data[i]
#     if len(IndexEslite.objects.filter(index=i))==0:
#         indexModel_list.append(IndexEslite(index=i, book=Book.objects.filter(index__contains={'eslite':i})[0]))
#     else:
#         print('pass: ',count)
#     count+=1
# if len(indexModel_list)>0:
#     IndexEslite.objects.bulk_create(indexModel_list)


# []
# objects.bulk_create([Modle])
# filter(tag__contains={"":""})
