from .serializers import UserSerializer, PostSerializer, CollectSerializer, UserInfoSerializer
from .models import Post, PostTest
from books.models import Collect


from rest_framework.views import APIView
from rest_framework.response import Response

from rest_framework import status, viewsets

from rest_framework import generics  # 包含APIView, 可套用已寫好的使用
from rest_framework import mixins    # 選擇方法請看原始碼(可忽略, generics有套好的了)

from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from rest_framework.decorators import api_view
from django.http import JsonResponse

from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404



class PostListCreateView(generics.ListCreateAPIView): # ListCreateAPIView 包含get, post了
    # permission_classes = [AllowAny]
    # authentication_classes = [SessionAuthentication, BasicAuthentication]

    permission_classes = [IsAdminUser]
    serializer_class = PostSerializer
    queryset = Post.objects.all()


# class MyCollectView2(generics.ListAPIView, generics.UpdateAPIView): 
#     authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
#     permission_classes = [IsAuthenticated]
#     # serializer_class = CollectSerializer
#     def get_serializer(self):
#         if self.request.method == 'GET':
#             return CollectSerializer
#         myCollect = Collect.objects.filter(user=self.request.user)
#         return CollectSerializer(myCollect, data=self.request.data)
#     def get_queryset(self):
#         user = self.request.user
#         # if self.request.method == 'GET':
#         return Collect.objects.filter(user=user)

@api_view(['GET', 'PUT'])
def MyCollectView1(request):
    print('<-------------init-------------->')
    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]
    try:
        snippet = Collect.objects.get(user=request.user)
    except Collect.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = CollectSerializer(snippet)
        return Response(serializer.data)

    elif request.method == 'PUT':
        print('--->MY data is : ', request.data)
        serializer = CollectSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # elif request.method == 'DELETE':
    #     snippet.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)


class UserCreateView(generics.CreateAPIView):
    permission_classes = [AllowAny]
    serializer_class = UserSerializer
    queryset = User.objects.all()

class UserInfoView(APIView):
    # authentication_classes = [SessionAuthentication, BasicAuthentication]
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self, request, format=None):
        user = User.objects.get(username= request.user)
        serializer = UserInfoSerializer(user)
        data = serializer.data
        data.update
        a.update({"dd":1})
        return Response(serializer.data)

# class UserInfoView(generics.ListAPIView):
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     # authentication_classes = [TokenAuthentication]
#     permission_classes = [IsAdminUser, IsAuthenticated]
#     serializer_class = UserInfoSerializer
#     def get_queryset(self):
#         print(self.request.user)
#         user = self.request.user
#         return user.accounts.all()
    


class UserRecordView(APIView):
    permission_classes = [AllowAny]
    def get(self, format=None):
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    def post(self, request):   # 新增使用者
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid(raise_exception=ValueError):
            serializer.create(validated_data=request.data)
            print(request.data)
            return Response(
                serializer.data,
                status=status.HTTP_201_CREATED
            )
        return Response(
            {
                "error": True,
                "error_msg": serializer.error_messages,
            },
            status=status.HTTP_400_BAD_REQUEST
        )

class TestView(APIView):
    print('TestView')
    authentication_classes = [SessionAuthentication, BasicAuthentication]
    permission_classes = [AllowAny]

    def get(self, request,  *args, **kwargs):

        qs = Post.objects.all()
        serializer = PostSerializer(qs, many=True)
        return Response(serializer.data)
        # data={'title':'title123', 'desg':123}
    def post(self, request,  *args, **kwargs):
        # permission_classes = [IsAuthenticated, IsAdminUser]
        serializer = PostSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)
        # return Response(serializer.errors, status= status.HTTP_505_HTTP_VERSION_NOT_SUPPORTED)
        # {"title":"1243","description":"sdf"}

