# TODO polls
# from django.views.generic.base import TemplateView

from . import views, school_views
from . import views, users_sign, users_sett
from django.urls import path
from . import views, update, test
urlpatterns = [
    # TODO FindBook
    path('', include('polls.urls')),
    path('api-auth/', include('rest_framework.urls')),
    path('s/', include('searchBook.urls')),
    path('user/', include('users.urls')),
    path('admin/', admin.site.urls),
    # TODO polls
    path('', views.index, name='home'),
    path('test', test.test0),
    path("robots.txt", views.robots),
    # -------------測試階段--------------
    # path('test/', test.test0, name='test'),
    # test1
    # path('test/get/', test.test1, name='test'),
    # path('test2/', test.test2, name='test2'),
    # path('test/Http/', test.getHttpRequest, name='getHttpRequest'),
    # path('test/fix/', test.fix, name='fix'),
    # path('test/collect/', test.collect, name='collect'),
    # path('getCollege/', test.getCollege,  name='getCollege'),
    # -------------測試階段--------------
    # path('top1', views.top_getName, name='top_getName'),
    # path('top/<int:q_page>/', views.top, name='top'),
    # path('updateTop', update.updateTop, name='updateTop'),
    # TODO users
    path('', views.Home),
    path('account/', views.Home),
    path('account/profile/', views.Home, name='account'),
    path('collect/', views.Collect),
    path('collect/', views.MyCollected, name='myCollect'),
    path('set/password/', views.Password, name='password'),
    path('set/password/setting/', sett.Password, name='setPassword'),
    path('login/', sign.Login),
    path('sign-in/', sign.SignIn, name='signIn'),
    path('sign-up/', sign.SignUp, name='signUp'),
    path('signOut/', sign.SignOut, name='signOut'),
    path('test/', sign.Test),
    # TODO searchBook

    path('test/', views.test, name='test'),
    path('school/', school_views.index),
    path('tmp_school/', school_views.test_index),
    path('items/', views.testMultSearch, name='mult'),
    path('product/', views.testIndexSearch, name='index'),
    path('tmp/', views.checkTmp),
    # path('', views.checkey, name='checKey'),
    # path('x96y4t86vjp6gjru6/', views.checkey2),
    # path('i/<key>', views.indexSearch),
    # path('i/', views.indexSearch),
    # path('price/', storePrice.ajaxPrice, name='storePrice'),
    # path('library/', school.index, name='library'),
    # path('kotlin/', storePrice.kotlin),
    # path('lingtung/', school.LingTung, name='lingtung'),
]
