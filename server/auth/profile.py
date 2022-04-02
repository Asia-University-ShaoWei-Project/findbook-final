from django.shortcuts import render


def Info(req):
  # todo: user info
  return render(req, 'User/login.html')
