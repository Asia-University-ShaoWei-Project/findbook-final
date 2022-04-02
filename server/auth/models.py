import datetime
from django.db import models
from django.utils import timezone
# import uuid

# class BookInstance(models.Model):
#     id = models.UUIDField(primary_key=True, default=uuid.uuid4, help_text='Unique ID for this particular book across whole library')
#     book = models.ForeignKey('Books1', on_delete=models.SET_NULL, null=True)
#     imprint = models.CharField(max_length=200)
#     due_back = models.DateField(null=True, blank=True)

#     LOAN_STATUS = (
#         ('m', 'Maintenance'),
#         ('o', 'On loan'),
#         ('a', 'Available'),
#         ('r', 'Reserved'),
#     )

#     status = models.CharField(
#         max_length=1,
#         choices=LOAN_STATUS,
#         blank=True,
#         default='m',
#         help_text='Book availability',
#     )

#     class Meta:
#         ordering = ['due_back']

#     def __str__(self):
#         return f'{self.id}'


class Top(models.Model):
    page = models.CharField(primary_key=True, max_length=2,null=False)
    isbn = models.CharField(max_length=13)
    name = models.CharField(max_length=130)
    price = models.CharField(max_length=4,null=True)
    img_url = models.CharField(max_length=130)
    created = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.isbn


# class UniversityName(models.Model):
#     content = models.TextField()

# class Search():
# from django import forms
# class CreateUserCollectFolder(forms.Form):
#     folder_name = forms.CharField(max_length=15, label="Folder Name")
#     book_id = forms.IntegerField()


class Collect(models.Model):
  email_id = models.CharField(max_length=20)
  content = models.TextField(default="{'default':[]")
  note0 = models.TextField(default="{}")
  note1 = models.TextField(default="{}")
  note2 = models.TextField(default="{}")
  note3 = models.TextField(default="{}")
  note4 = models.TextField(default="{}")
  note5 = models.TextField(default="{}")
  note6 = models.TextField(default="{}")
  note7 = models.TextField(default="{}")
  note8 = models.TextField(default="{}")
  note9 = models.TextField(default="{}")

  def __str__(self):
    return self.account


class Profile(models.Model):
  user = models.OneToOneField(
      User,
      on_delete=models.CASCADE, null=True)
  collect = jsonfield.JSONField(default={"favorite": []})

  def __str__(self):
    return self.user
# class Collect_tmp(Profile):
#     folder_name = models.CharField(max_length=15, null=True)
#     def __str__(self):
#         return self.folder_name


# class Collect_tmp(Profile):
#     folder_name = models.CharField(max_length=15, null=True)
#     def __str__(self):
#         return self.folder_name
  # collect = jsonfield.JSONField()

# class Profile_tmp(User): # 不好用
#     collect = models.CharField(max_length=10, default="d")