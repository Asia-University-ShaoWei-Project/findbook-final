# # sett.py

# from django.views.decorators.csrf import csrf_exempt
# from django.http.response import JsonResponse, HttpResponse
# from django.contrib.auth.decorators import login_required
# from django.contrib.auth.models import User
# from django.shortcuts import render, redirect
# from django.http.response import JsonResponse


# def Password(request):
#   print('------------進入 設定密碼------------')

#   old = request.POST.get('old')
#   new_pwd = request.POST.get('new')
#   new2_pwd = request.POST.get('new2')

#   try:
#     import re
#     if request.user.is_authenticated and bool(re.match(r'[A-Za-z0-9@#$%^&+=]{8,}', new_pwd) and (new_pwd == new2_pwd)):
#       from django.contrib.auth.models import User
#       user = User.objects.get(username=request.user.username)
#       if user.check_password(old):
#         print('password is True')
#         from django.contrib.auth import logout
#         print('密碼輸入正確')
#         logout(request)
#         user.set_password(new_pwd)
#         user.save()
#         return render(request, 'User/password.html',
#                       {'isUser': request.user.is_authenticated, 'status': True})
#       else:
#         print('舊密碼錯誤')
#         return render(request, 'User/setting.html', {'isUser': request.user.is_authenticated, 'message': '密碼更改失敗'})
#     else:
#       print('密碼設置有問題')
#       return render(request, 'User/base.html', {'isUser': request.user.is_authenticated, 'message': '密碼設置有問題', 'status': False})
#   except:
#     print('錯誤')
#     return render(request, 'User/password.html', {'isUser': request.user.is_authenticated, 'message': '錯誤', 'status': False})


# def Forgot(request):
#   return render(request, 'User/emailMessage.html')

# # TODO sign.py


# @csrf_exempt
# def SignIn(request):
#   if request.method == 'POST':
#     from django.contrib.auth import authenticate, login
#     account = request.POST['account']
#     password = request.POST['password']
#     user = authenticate(request, username=account, password=password)
#     if user and user.is_active:
#       login(request, user)
#       return JsonResponse({"work": "success"})
#     return JsonResponse({"work": "fault"})


# @login_required
# def SignOut(request):
#   from django.contrib.auth import logout
#   logout(request)
#   return redirect('/')


# def CheckSignUpAccount(request):
#   print("------------進入檢查帳戶是否存在------------")
#   if request.method == 'POST' and (not request.user.is_authenticated):
#     account = request.POST['account']
#     email = request.POST['email']
#     print("得到資料-> account: ", account, "email: ", email)
#     form = User(request.POST)
#     # if form is None:
#     #     print('is_valid()')
#     # else:
#     #     print('none')
#   else:
#     return render(request, 'index.html', {'message': '警告!'})


# def SignUp(request):
#   print("------------進入 POST------------")
#   if request.method == 'POST' and (not request.user.is_authenticated):
#     print("是POST")
#     account = request.POST['account']
#     password = request.POST['password']
#     name = request.POST['name']
#     email = request.POST['email']
#     print("得到資料-> account: ", account, " , password: ",
#           password, " , name: ", name, "email: ", email)
#     try:
#       User.objects.get(username=account)
#       print("已有帳號")
#       return render(request, 'index.html', {'alert': '已有帳號'})
#     except:
#       print("正在創建")
#       User.objects.create_user(
#           username=account,
#           first_name=name,
#           email=email,
#           password=password
#       )
#       print("User創建完成")
#       from polls.models import Collect
#       Collect(account=account).save()
#       print("Collect創建完成")
#     # return render(request, 'index.html', {'name':name})
#       return render(request, 'index.html', {'message': '註冊成功', 'name': name})
#   else:
#     return render(request, 'index.html', {'message': '警告!'})


# def Login(request):
#   if not request.user.is_authenticated:
#     return render(request, 'User/login.html')
#   else:
#     return redirect('/user/account')
