

from django.urls import path
from . import views, school_views
urlpatterns = [
    path('cronjob/bastseller', views.UpdateBastseller),
]
