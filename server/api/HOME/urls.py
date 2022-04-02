from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls', namespace='api')),
    path('api-token-auth/', views.obtain_auth_token, name='api-token-auth'),
    # path('dj-rest-auth/', include('dj_rest_auth.urls')),

    # path('social-auth/', include('social_django.urls', namespace='social')),


    path('user/', include('loginAPI.urls')),
    path('book/', include('books.urls')),
]