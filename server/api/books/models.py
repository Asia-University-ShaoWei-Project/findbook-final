from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Collect(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    collect = models.TextField(default="{'default':[]}") 
    def __str__(self):
        return self.user

class Books(models.Model):
    title = models.TextField()
    isbn = models.CharField(max_length=13)
    def __str__(self):
        return self.title
