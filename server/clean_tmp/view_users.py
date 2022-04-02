from django.shortcuts import render, redirect
from django.http.response import JsonResponse
from django.contrib.auth.decorators import login_required

@login_required
def Home(request):
    print('進入使用者介面')
    email = request.user.email
    return  render(request, 'User/info.html', {
        'isUser': request.user.is_authenticated,
        'userName':request.user.first_name+' '+request.user.last_name,
        'email':email[:2] +'****@'+ email.split('@')[-1]
        })

@login_required
def Password(request):
    print('進入密碼')
    return render(request, 'User/setting.html', {'isUser': request.user.is_authenticated})

@login_required
def MyCollected(request):
    print('進入我的收藏')
    from .models import Collect

    collectClass = 'default'
    dataList = []
    from users.models import Collect
    from packets.checkISBN import checkISBN
    try:
        user = Collect.objects.get(account= request.user.username)
        Class = eval(user.content)[collectClass]
        userNote = [
            eval(user.note0), eval(user.note1), eval(user.note2), eval(user.note3), eval(user.note4),
            eval(user.note5), eval(user.note6), eval(user.note7), eval(user.note8), eval(user.note9)
        ]
        for index in Class:
            print(index)
            try:
                from searchBook.models import Book
                check = checkISBN(index)
                if check[0]: #is isbn
                    print('is 13')
                    t_book = Book.objects.get(ISBN_13= index) if check[1]==13 else Book.objects.get(ISBN_10= index)
                else:
                    t_book = Book.objects.get(Index= index)

                # note = eval(Collect)
                # print(userNote[index[-1]][index])
                dataList.append([t_book.Img, t_book.Title, t_book.Date, userNote[int(index[-1])][index]]) #name,date,url,note
                # dataList.append([t_book.Img, t_book.Title, t_book.Date]) #name,date,url,note
            except:
                
                print('except')
                pass
        print('sent!')
        return render(request, 'User/collect.html', 
        {'isUser':request.user.is_authenticated,'data':dataList})
    except:
        print('error')

        return redirect('/')
@login_required
def Collect_tmp(request):
    from .models import Profile as pf
    from searchBook.models import Book
    if request.method=='POST':
        rq_folder_name = request.POST.get('folder')
        rq_collet_isbn = request.POST.get('isbn')
        rq_method = request.POST.get('method')
        bookID = Book.objects.get(ISBN13=rq_collet_isbn) if len(rq_collet_isbn)==13 else Book.objects.get(ISBN10=rq_collet_isbn)
        if len(rq_folder_name)<15 and rq_collet_key>0:
            profile = pf.objects.get(user=request.user)
            rq_collet_key = str(rq_collet_key).split()
            if rq_method == 0: # build folder
                profile[rq_collet_key] = [] if rq_collet_key==None else [rq_collet_key]
            elif rq_method == 1: # add book id
                profile[rq_collet_key] = [] if rq_collet_key==None else [rq_collet_key]





@login_required
def Collect(request):
    print('------------進入執行收藏------------')
    # if request.method=='POST' and request.user.is_authenticated:
    if request.method=='POST':
        # from packets.checkISBN import checkISBN
        from .models import Collect
        userNote = request.POST.get('note')[:150]


        
        className = request.POST.get('Class')[:50]
        key = request.POST.get('key')

        message = ''
        tmpNote = ''
        print('key :', key, 'class : ', className)
        try:
            user = Collect.objects.get(account =request.user.username)
            content = eval(user.content) #取得使用者收藏庫
            tail = int(key[-1])
            if tail < 5:  # 取得使用者筆記分類
                if tail == 0 : note = user.note0
                elif tail == 1 : note = user.note1
                elif tail == 2 : note = user.note2
                elif tail == 3 : note = user.note3
                elif tail == 4 : note = user.note4
            else:
                if tail == 5 : note = user.note5
                elif tail == 6 : note = user.note6
                elif tail == 7 : note = user.note7
                elif tail == 8 : note = user.note8
                elif tail == 9 : note = user.note9
            print('numTail : ',tail)
            note = eval(note)
            print('note : ',note)

            if className in content: # 進行收藏或移除動作
                print('in the content!')
                if key in content[className]:
                    print('remove')
                    content[className].remove(key)
                    del note[key]
                    message = 'success remove'
                else:
                    print('append')
                    content[className].append(key)
                    note[key] = userNote
                    message = 'success save'
                print(message)
                user.content = content 
                if tail < 5:
                    if tail == 0 : user.note0 = note
                    elif tail == 1 : user.note1 = note
                    elif tail == 2 : user.note2 = note
                    elif tail == 3 : user.note3 = note
                    elif tail == 4 : user.note4 = note
                else:
                    if tail == 5 : user.note5 = note                   
                    elif tail == 6 : user.note6 = note
                    elif tail == 7 : user.note7 = note
                    elif tail == 8 : user.note8 = note
                    elif tail == 9 : user.note9  = note
                user.save()           
                print('save')
                return JsonResponse({'status':2, 'message': message})
            else:
                print('not find class')
                return JsonResponse({'status':1,'message':'not find class'})

        except:
            return JsonResponse({'status':0, 'message':'Save Error'})
    else:
        print('不是POST')
        return JsonResponse({'status':0, 'messenger':'this not post'})
