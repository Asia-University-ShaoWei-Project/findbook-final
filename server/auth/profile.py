  path('login', views.login),
    path('logout', views.logout),
    path('register', views.register),
    path('profile', views.info),
    path('profile/info', views.info),
    path('profile/reset-pwd', views.reset_password_page),
    path('profile/reset-pwd/change', views.reset_password),
if req.user.is_authenticated:
.body)# b''
.scheme # http
.path # /test/Http/
.path_info # /test/Http/
.method # GET
.encoding # None
.content_type # text/plain
.content_params # {}
.headers # {'Content-Length': ''

    # sett.py

from tabnanny import check
from django.views.decorators.csrf import csrf_exempt
from django.http.response import JsonResponse, HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.http.response import JsonResponse


def Password(req):
  print('------------進入 設定密碼------------')

  old = req.POST.get('old')
  new_pwd = req.POST.get('new')
  new2_pwd = req.POST.get('new2')

  try:
    import re
    if req.user.is_authenticated and bool(re.match(r'[A-Za-z0-9@#$%^&+=]{8,}', new_pwd) and (new_pwd == new2_pwd)):
      from django.contrib.auth.models import User
      user = User.objects.get(username=req.user.username)
      if user.check_password(old):
        print('password is True')
        from django.contrib.auth import logout
        print('密碼輸入正確')
        logout(req)
        user.set_password(new_pwd)
        user.save()
        return render(req, 'User/password.html',
                      {'isUser': req.user.is_authenticated, 'status': True})
      else:
        print('舊密碼錯誤')
        return render(req, 'User/setting.html', {'isUser': req.user.is_authenticated, 'message': '密碼更改失敗'})
    else:
      print('密碼設置有問題')
      return render(req, 'User/base.html', {'isUser': req.user.is_authenticated, 'message': '密碼設置有問題', 'status': False})
  except:
    print('錯誤')
    return render(req, 'User/password.html', {'isUser': req.user.is_authenticated, 'message': '錯誤', 'status': False})
# TODO sign.py


# @csrf_exempt
# def SignIn(req):
#   if req.method == 'POST':
    
#     account = req.POST['account']
#     password = req.POST['password']
#     user = authenticate(req, username=account, password=password)
#     if user and user.is_active:
#       login(req, user)
#       return JsonResponse({"work": "success"})
#     return JsonResponse({"work": "fault"})


# @login_required
# def SignOut(req):
#   from django.contrib.auth import logout
#   logout(req)
#   return redirect('/')


def CheckSignUpAccount(req):
  print("------------進入檢查帳戶是否存在------------")
  if req.method == 'POST' and (not req.user.is_authenticated):
    account = req.POST['account']
    email = req.POST['email']
    print("得到資料-> account: ", account, "email: ", email)
    form = User(req.POST)
    # if form is None:
    #     print('is_valid()')
    # else:
    #     print('none')
  else:
    return render(req, 'index.html', {'message': '警告!'})


def SignUp(req):
  print("------------進入 POST------------")
  if req.method == 'POST' and (not req.user.is_authenticated):
    print("是POST")
    account = req.POST['account']
    password = req.POST['password']
    name = req.POST['name']
    email = req.POST['email']
    print("得到資料-> account: ", account, " , password: ",
          password, " , name: ", name, "email: ", email)
    try:
      User.objects.get(username=account)
      print("已有帳號")
      return render(req, 'index.html', {'alert': '已有帳號'})
    except:
      print("正在創建")
      User.objects.create_user(
          username=account,
          first_name=name,
          email=email,
          password=password
      )
      print("User創建完成")
      from polls.models import Collect
      Collect(account=account).save()
      print("Collect創建完成")
    # return render(req, 'index.html', {'name':name})
      return render(req, 'index.html', {'message': '註冊成功', 'name': name})
  else:
    return render(req, 'index.html', {'message': '警告!'})


def Login(req):
  if not req.user.is_authenticated:
    return render(req, 'User/login.html')
  else:
    return redirect('/user/account')
# TODO Remake

from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required

import code
profile_page = 'auth/profile.html'
login_page = 'auth/login.html'
# @csrf_exempt
def Login(req):
  if req.user.is_authenticated:
    return redirect(profile_page)
  if req.method == 'GET':
    return render(req, login_page)
  if req.method == 'POST':
    email = req.POST['email']
    password = req.POST['password']
    auth = authenticate(req, email=email, password=password)
    if auth and auth.is_active:
      login(req, auth)
      return redirect(profile_page)
    return render(req, login_page, {"msg": code.Err_Login})
from django.contrib.auth import logout

@login_required
def Logout(req):
  logout(req)
  return redirect('/')
def Register(req):
  valid = False
  if req.user.is_authenticated:
    return redirect('/auth/profile')
  if req.method == 'POST':
    email = req.POST['email']
    password = req.POST['password']
    username = req.POST['username']
    if check_req_variable_isEmpty(email, password, username):
      return render(req, login_page, {"msg": code.Err_Arg})
    if check_email_exist(email):
      return render(req, login_page, {"msg": code.Msg_Email_Is_Exist})
    if create_user(email, password, username):

  try:
    except:

      print("Collect創建完成")
    # return render(req, 'index.html', {'name':name})
      return render(req, 'index.html', {'message': '註冊成功', 'name': name})
  else:
    return render(req, 'index.html', {'message': '警告!'})
def check_req_variable_isEmpty(*keys)->bool:
  isEmpty = False
  for i in keys:
    if len(i) == 0:
      isEmpty = True
      break
  return isEmpty

def check_email_exist(email) -> bool:
  # TODO: DB check email exist
  check_valid = True
  return check_valid
from django.contrib.auth.models import User
from models import Collect
def create_user(email, password, username) -> bool:
  valid = True
  # TODO: condition the success of create and collect
  User.objects.create_user(
          email=email,
          password=password
          username=username,
      )
  Collect(email_id=email).save()
  return valid
def Info(req):
  return reset_password_page(req, 'User/login.html')
def Reset_password_page(req):
  return render(req, 'User/login.html')
def Reset_password(req):
  return render(req, 'User/login.html')