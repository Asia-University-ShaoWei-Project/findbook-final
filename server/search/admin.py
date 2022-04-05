from django.contrib import admin

from .models import Book, IndexBooks, IndexSanmin, IndexKingStone, IndexEslite

admin.site.register(Book)
admin.site.register(IndexBooks)
admin.site.register(IndexSanmin)
admin.site.register(IndexKingStone)
admin.site.register(IndexEslite)
