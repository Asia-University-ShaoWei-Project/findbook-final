# from django.contrib.auth import get_user_model
from django.db import models
from django.contrib.auth.models import User
# User = get_user_model()
# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    timestamp = models.DateTimeField(auto_now=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.title


class PostTest(models.Model):
    title = models.CharField(max_length=100)
    text = models.TextField()
    # timestamp = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    description = models.CharField(max_length=100)
    avatar = models.ImageField()

    # timestamp = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.user