from django.contrib import admin
from .models import Books, Collect
# Register your models here.
admin.site.register(Collect)
admin.site.register(Books)
# admin.site.register(Snippet)