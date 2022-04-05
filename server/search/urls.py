
from django.urls import path
from . import views, school_views, admin
urlpatterns = [
    path('test/', views.test, name='test'),
    path('school/', school_views.index),
    path('tmp_school/', school_views.test_index),
    path('items/', views.testMultSearch, name='mult'),
    path('product/', views.testIndexSearch, name='index'),
    # path('', views.checkey, name='checKey'),
    # path('x96y4t86vjp6gjru6/', views.checkey2),
    # path('i/<key>', views.indexSearch),
    # path('i/', views.indexSearch),
    # path('price/', storePrice.ajaxPrice, name='storePrice'),
    # path('library/', school.index, name='library'),
    # path('kotlin/', storePrice.kotlin),
    # path('lingtung/', school.LingTung, name='lingtung'),
    path('admin/', admin.site.urls),

]
