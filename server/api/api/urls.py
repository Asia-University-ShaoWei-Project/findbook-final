from django.urls import path
from .views import  TestView, UserRecordView, PostListCreateView
from .views import  UserCreateView, UserInfoView
from .views import  MyCollectView1

app_name = 'api'
urlpatterns = [
    path('user/', UserRecordView.as_view(), name='users'),
    # path('test/', UserList.as_view()),
    path('post-create/', PostListCreateView.as_view(), name='post-create'),
    path('myCollect/', MyCollectView1),
    path('userinfo/', UserInfoView.as_view()),
    path('usercreate/', UserCreateView.as_view()),
    
]
