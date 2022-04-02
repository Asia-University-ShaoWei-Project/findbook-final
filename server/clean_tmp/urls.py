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
]
