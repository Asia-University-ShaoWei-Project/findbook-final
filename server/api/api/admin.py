from django.contrib import admin

# Register your models here.
from .models import Post
class TestAdmin(admin.ModelAdmin):
    # list_display=('isbn','name','price')
    list_display= ('title',)
    list_filter = ('title',)
admin.site.register(Post, TestAdmin)
