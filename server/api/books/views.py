from django.shortcuts import render
from .models import Collect
# Create your views here.def a
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.http.response import JsonResponse, HttpResponse


@csrf_exempt
def AddCollect(request):
    try:
        aa=Collect(user=User.objects.get(username=request.POST['username'], password=request.POST['password']))
        aa.save()
        return HttpResponse("susse")
    except:
        return HttpResponse("no")