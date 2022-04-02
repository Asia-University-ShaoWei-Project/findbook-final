from django.contrib.auth.decorators import login_required

from django.http.response import JsonResponse, HttpResponse

from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def Test(request):
    print('checkLogin')
    if request.user.is_authenticated:
        print('是使用者')

        return JsonResponse({"user":"yes"})
    else:
        print('不適使用者')
        return JsonResponse({"user":"no"})

@csrf_exempt
def SignIn(request):
    print("------------<User LogIn>------------!")
    if request.method == 'POST':
        from django.contrib.auth import authenticate, login
        user = authenticate(request, username = request.POST['account'], password = request.POST['password'])
        if user is not None: # 有此使用者
            print("is User!")
            if user.is_active:  # 此使用者是否可用
                login(request, user)
                print('登入成功')
                return JsonResponse({"work":"success"})
                # return redirect('/')
            else:
                print('login error')
                return JsonResponse({"work":"not working"})
                # return render(request, 'index.html', {'alert':'帳號失效!'})
        else:
            print("沒有此使用者")
            #不會轉網址
            return HttpResponse("沒有此帳戶 或 錯誤")
    else:
        return HttpResponse("警告")

@login_required
def SignOut(request):
    from django.contrib.auth import logout
    print('------------進入 登出!------------')
    try:
        logout(request)
        return HttpResponse("work!")
    except:
        return HttpResponse("not work")

