from rest_framework import serializers
from django.contrib.auth.models import User

from rest_framework.validators import UniqueTogetherValidator

from .models import Post
from rest_framework.authtoken.models import Token

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = (
            'title', 'description'
        )

class UserSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        user = User.objects.create(
            username = validated_data['username'],
            password = validated_data['password'],
            email = validated_data['email'],
        )
        # collect_data = validated_data.pop('profile')
        # collect = Collect.objects.create(user = user)
        # Token.objects.create(user=user)
        return user
    # def create(self, validated_data):
    #     return User.objects.create_user(**validated_data)
    class Meta:
        model = User
        fields = ('email', 'username', 'password')

class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('email','username',)

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('email','username',)


from books.models import Collect
class CollectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Collect
        fields = ('collect',)
    # created = serializers.DateTimeField()
    # def create(self, validated_data):
    #     print('this is my validated_data : ', validated_data)
    #     validated_data['user']=self.request.user
        # return Collect.objects.create(**validated_data)
    def update(self, instance, validated_data):
        my_status = True
        try:
            my_collect = eval(instance.collect)
            rq_data = eval(validated_data.get('collect'))
            # [
            # method:   0=book, 1=folder ----------------- (0)
            # action:   0=add or create, 1=delect -------- (1)
            # key:      folder name ---------------------  (2)
            # data:     isbn or isbn_id -----------------  (3)
            # index:    if want delet,index has value ---  (4)
            # ]
            # for i in range(5):
            #     print(type(rq_data[i]))

            if rq_data[0] == 0: # method(book)
                if rq_data[1] == 0: # action(add)   
                    my_collect[rq_data[2]].append(rq_data[3]) # key & data
                    print('---> list append')
                elif rq_data[1] == 1: # action(remove)
                    my_collect[rq_data[2]].pop(rq_data[4]) # key & index
                    print('---> list pop')
            elif rq_data[0] == 1: # method(folder)
                if rq_data[1] == 0:
                    if rq_data[3]: # create folder and add data
                        my_collect[rq_data[2]] = [rq_data[3]] 
                    else: # create empty folder
                        my_collect[rq_data[2]] = []
                    print('---> create folder')
                elif rq_data[1] == 1:
                    my_collect.pop(rq_data[2])  # remove user current folder[key]
                    print('---> folder pop')
            instance.collect = my_collect
            instance.save()
        except Exception as e:
            print('收藏錯誤')
            print(e)
            my_status = False
        # instance.status = my_status
        print('------------>MY NEW data is : ', instance.collect)
        return instance







        # a={ "a":1,"b":2,"c":3,"d":4,}
        # a=['1','7','2','4','3']
        # validators = [
        #     UniqueTogetherValidator(
        #         queryset=Collect.objects.all(),
        #         fields=['user', 'collect']
        #     )
        # ]