from django.urls import path
from . import views
urlpatterns = [
    path('login', views.login),
    path('logout', views.logout),
    path('register', views.register),
    path('profile', views.info),
    path('profile/info', views.info),
    path('profile/reset-pwd', views.reset_password_page),
    path('profile/reset-pwd/change', views.reset_password),
]
