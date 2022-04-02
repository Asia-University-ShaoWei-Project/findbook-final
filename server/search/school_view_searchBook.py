from django.http.response import JsonResponse
from packages.package import checkISBN, get_request_data
# from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def index(request):
    if request.method == "POST":
        print('into school')
        req_key = request.POST.get('key') # isbn
        req_city = request.POST.get('city') # Taipei
        req_school = request.POST.get('school') # niu
        print("req_key: {},req_city: {}, req_school: {}".format(req_key, req_city, req_school))
        check = checkISBN(req_key)
        msg = ''
        if check[0]: # is ISBN?
        # if request.user.is_authenticated and check[0]:
            # url = ''
            # status = False
            school_func = None

            try:
                if (req_city=='changhua') and (req_school in ['ccut', 'ctu', 'dyu', 'mdu', 'ncue']):
                    from .school import changhua
                    
                    school_func = changhua
                elif (req_city=='chiayi') and (req_school in ['ccu', 'cjc', 'ncyu', 'nhu', 'toko', 'ttc', 'wfu']):
                    from .school import chiayi
                    
                    school_func=chiayi
                elif (req_city=='hsinchu') and (req_school in ['chu', 'hcu', 'must', 'nctu', 'nthu', 'tust', 'ypu']):
                    from .school import hsinchu
                    
                    school_func=hsinchu
                elif (req_city=='hualien') and (req_school in ['dahan', 'ndhu', 'tcu', 'tcust', 'tht']):
                    from .school import hualien
                    
                    school_func=hualien
                elif (req_city=='kaohsiung') and (req_school in ['csu', 'fotech', 'fy', 'isu', 'kmu', 'kyu', 'nknu', 'nkuht', 'nkust', 'nsysu', 'nuk', 'stu', 'szmc', 'tf', 'wzu', 'yuhing']):
                    from .school import kaohsiung
                    
                    school_func=kaohsiung
                elif (req_city=='keelung') and (req_school in ['cku', 'cufa', 'ntou']):
                    from .school import keelung
                    
                    school_func=keelung
                elif (req_city=='kinmen') and (req_school in ['nqu']):
                    from .school import kinmen
                    
                    school_func=kinmen
                # elif (req_city=='lienchiang') and (req_school in []):
                #     from .school import lienchiang
                #     {}
                    # school_func=lienchiang
                elif (req_city=='miaoli') and (req_school in ['jente', 'nuu', 'ydu']):
                    from .school import miaoli
                    
                    school_func=miaoli
                elif (req_city=='nantou') and (req_school in ['ncnu', 'nkut']):
                    from .school import nantou
                    
                    school_func=nantou
                elif (req_city=='newTaipei') and (req_school in ['au', 'chihlee', 'ctcn', 'dila', 'fju', 'hdut', 'hfu', 'hwh', 'hwu', 'just', 'lit', 'mcut', 'mmc', 'ntpu', 'ntua', 'oit', 'sju', 'tku', 'tnu', 'tumt']):
                    from .school import newTaipei
                    
                    school_func=newTaipei
                elif (req_city=='penghu') and (req_school in ['npu']):
                    from .school import penghu
                    
                    school_func=penghu
                elif (req_city=='pingtung') and (req_school in ['meiho', 'nptu', 'npust', 'tajen', 'tzuhui']):
                    from .school import pingtung
                    
                    school_func=pingtung
                elif (req_city=='taichung') and (req_school in ['asia', 'cmu', 'csmu', 'ctust', 'cyut', 'fcu', 'hk', 'hust', 'ltu', 'nchu', 'ncut', 'ntcu', 'ntupes', 'nutc', 'ocu', 'pu', 'thu']):
                    from .school import taichung
                    {
                        'asia': 'http://120.108.102.23/inspireapp/API?identify=AUL&func=queryBibliographic&condition=3&input={isbn}&locationId=303&start=0&limit=1&sb=relevance&ob=desc', 
                        'cmu': {'isAPI':True, 'url':''},  'csmu': {'isAPI':True, 'url':''},  'ctust': {'isAPI':True, 'url':''},  'cyut': {'isAPI':True, 'url':''},  'fcu': {'isAPI':True, 'url':''},  'hk': {'isAPI':True, 'url':''},  'hust': {'isAPI':True, 'url':''},  'ltu': {'isAPI':True, 'url':''},  'nchu': {'isAPI':True, 'url':''},  'ncut': {'isAPI':True, 'url':''},  'ntcu': {'isAPI':True, 'url':''},  'ntupes': {'isAPI':True, 'url':''},  'nutc': {'isAPI':True, 'url':''},  'ocu': {'isAPI':True, 'url':''},  'pu': {'isAPI':True, 'url':''},  'thu': {'isAPI':True, 'url':''},  }
                    school_func=taichung
                elif (req_city=='tainan') and (req_school in ['cjcu', 'cnu', 'ctbc', 'feu', 'hwai', 'ksu', 'mhchcm', 'ncku', 'ntin', 'nutn', 'stust', 'tnnua', 'tsu', 'tut']):
                    from .school import tainan
                    
                    school_func=tainan
                elif (req_city=='taipei') and (req_school in ['cust', 'cute', 'mcu', 'mkc', 'nccu', 'ntnu', 'ntu', 'ntub', 'ntue', 'ntunhs', 'ntust', 'ntut', 'pccu', 'scu', 'shu', 'takming', 'tcpa', 'tmu', 'tnua', 'tpcu', 'ttu', 'ukn', 'usc', 'uTaipei', 'ym']):
                    from .school import taipei
                    
                    school_func=taipei
                elif (req_city=='taitung') and (req_school in ['ntc', 'nttu']):
                    from .school import taitung
                    
                    school_func=taitung
                elif (req_city=='taoyuan') and (req_school in ['cgu', 'cgust', 'cycu', 'hsc', 'knu', 'lhu', 'nanya', 'ncu', 'ntsu', 'uch', 'vnu', 'yzu']):
                    from .school import taoyuan
                    
                    school_func=taoyuan
                elif (req_city=='yilan') and (req_school in ['fgu', 'fit', 'niu', 'smc']):
                    from .school import yilan
                    
                    school_func=yilan
                elif (req_city=='yunlin') and (req_school in ['nfu', 'twu', 'yuntech']):
                    from .school import yunlin
                    school_func=yunlin
                if school_func != None:
                    try:
                        # url_attr = url_option[req_city][req_school]
                        # url = url_attr['url'].format(isbn= req_key)
                        # response = get_request_data(isSoup=False, method='get', url=url)
                        # json_data = response.json()
                        # if len(json_data) != 0: data = getattr(school_func, req_school)(json_data)
                        # else: data = {'status':True, 'info': {'exist':False}, 'msg':'book is not exist'}
                        data = getattr(school_func, req_school)(isbn = req_key)
                    except:
                        data = {'status':False, 'msg':'function error'}
                else:
                    data = {'status':False, 'msg':'attr error'}
            except:
                return JsonResponse({'status':False,'msg':'error'})
            return JsonResponse(data)  # result
        else:
            return JsonResponse({'status':False, 'msg':'ISBN error OR you not signup'})
    else:
        return JsonResponse({'status':False})


@csrf_exempt
def test_index(request):
    if request.method == "POST":
        print('into school')
        req_key = request.POST.get('key') # isbn
        req_city = request.POST.get('city') # Taipei
        req_school = request.POST.get('school') # niu
        if req_city=='chiayi':
            from .school.chiayi import ccu
            return JsonResponse(ccu(req_key))
        elif req_city=='taichung':
            from .school.taichung import asia
            return JsonResponse(asia(req_key))

        elif req_city=='taipei':
            from .school.taipei import nccu
            return JsonResponse(nccu(req_key))

        elif req_city=='taoyuan':
            from .school.taipei import yzu
            return JsonResponse(yzu(req_key))


        # print("req_key: {},req_city: {}, req_school: {}".format(req_key, req_city, req_school))
        # check = checkISBN(req_key)
    
