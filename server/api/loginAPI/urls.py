from django.urls import path
from . import views
urlpatterns = [
    path('signin/', views.SignIn),
    path('signout/', views.SignOut),
    path('checkLogin/', views.Test),
]
