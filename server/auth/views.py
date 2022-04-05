import msg
from models import Collect
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.shortcuts import render, redirect


profile_page = 'auth/profile.html'
login_page = 'auth/login.html'


def Login(req):
  if req.user.is_authenticated:
    return redirect(profile_page)
  if req.method == 'POST':
    email = req.POST['email']
    password = req.POST['password']
    auth = authenticate(req, email=email, password=password)
    if auth and auth.is_active:
      login(req, auth)
      return redirect(profile_page)
  return render(req, login_page, {"msg": msg.Err_Login})


@login_required
def Logout(req):
  logout(req)
  return redirect('/')


def Register(req):
  if req.user.is_authenticated:
    return redirect('/auth/profile')
  if req.method == 'POST':
    email = req.POST['email']
    password = req.POST['password']
    username = req.POST['username']
    if check_req_variable_isEmpty(email, password, username):
      return render(req, login_page, {"msg": msg.Err_Arg})
    if check_email_exist(email):
      return render(req, login_page, {"msg": msg.Msg_Email_Is_Exist})
    if create_user(email, password, username):
      return render(req, login_page, {"msg": msg.Msg_Create_Account_Success})
  return render(req, login_page)


def check_req_variable_isEmpty(*keys) -> bool:
  isEmpty = False
  for i in keys:
    if len(i) == 0:
      isEmpty = True
      break
  return isEmpty


def check_email_exist(email) -> bool:
  # TODO: DB check email exist
  # User.objects.get(username=account) # from signup check
  check_valid = True
  return check_valid


def create_user(email, password, username) -> bool:
  valid = True
  # TODO: condition the success of create and collect
  User.objects.create_user(
      email=email,
      password=password,
      username=username,
  )
  Collect(email_id=email).save()
  return valid
# todo


def getCollege(request):
  from .models import UniversityName
  content = eval(UniversityName.objects.get(id=1).content)
  return JsonResponse(content)


def collect(request):
  return render(request, 'User/collect.html', {'isUser': True})
