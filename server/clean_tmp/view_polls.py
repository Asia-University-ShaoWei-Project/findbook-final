from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, Http404, HttpResponseNotFound
from django.http.response import JsonResponse

from django.contrib import auth

# from .models import Top


def initMessenger(request):
  return JsonResponse(
      {
          'available_school': ['ccu', 'asia', 'chiayi', 'yzu', 'nccu']
      }
  )


def UserInfomation(request, message):
  return {
      'message': message,
      'userName': request.user.username,
      'isUser': request.user.is_authenticated,
  }


def index(request):
  if not request.user.is_authenticated:
    print('未登入者')
    return render(request, 'index.html', UserInfomation(request, '你尚未登入'))
  else:
    print('是登入者')
    return render(request, 'index.html', UserInfomation(request, '以登入'))


# def top(request, q_page):
#     print('------------進入 top------------')
#     # page = request.GET.get('q_page')
#     if q_page!=None:
#         page = q_page
#     else:
#         print('is none')
#     if Top.objects.all():
#         filters = Top.objects.filter(page=page)
#         if filters:
#             pages = [
#                 [page-1,page,page+1],
#                 list(range(1, int(Top.objects.order_by('-page')[0].page)+1))
#                 ]
#             return render(request, 'Search/top.html',{'books':filters,'pages':pages})
#         else:
#             return render(request, '404.html')
#     else:
#         return render(request, 'serverError.html')


#     #是否已登入的人
#     if not request.user.is_authenticated():
#         return HttpResponseRedirect('/login/?next=%s' % request.path)
