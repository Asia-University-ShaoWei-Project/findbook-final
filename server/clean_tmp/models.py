import jsonfield
from django.contrib.auth.models import User
from django.db import models

# Create your models here.
# TODO Polls
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
  page = models.CharField(max_length=2, null=True)
  isbn = models.CharField(max_length=13)
  name = models.CharField(max_length=130)
  price = models.CharField(max_length=4, null=True)
  img_url = models.CharField(max_length=130)
  created = models.DateTimeField(auto_now=True)

  def __str__(self):
    return self.isbn


# class UniversityName(models.Model):
#     content = models.TextField()

# class Search():
# TODO searchBook


class Book(models.Model):
  index = jsonfield.JSONField(
      default={'books': None, 'sanmin': None, 'kingstorn': None, 'eslite': None, })
  title = models.TextField()
  img_url = jsonfield.JSONField(
      default={'books': None, 'sanmin': None, 'kingstorn': None, 'eslite': None, })
  exist = jsonfield.JSONField(
      default={'books': None, 'sanmin': None, 'kingstorn': None, 'eslite': None, })
  ISBN_10 = models.CharField(max_length=10, default="0000000000")
  ISBN_13 = models.CharField(max_length=13, default="0000000000000")
  date = models.CharField(max_length=10, default="0")
  author = models.TextField(max_length=100)
  publisher = models.TextField(max_length=100)
  content = models.TextField(max_length=8000)

  price = jsonfield.JSONField(
      default={'books': None, 'sanmin': None, 'kingstorn': None, 'eslite': None, })
  update = models.DateTimeField(auto_now=True)
  created = models.DateTimeField(auto_now=True)

  def __str__(self):
    return self.title


index__contains = {'': ''}


class IndexBooks(models.Model):
  index = models.CharField(max_length=12, default='None')  # maxlen=10
  book = models.ForeignKey(Book, on_delete=models.CASCADE)


class IndexSanmin(models.Model):
  index = models.CharField(max_length=12, default='None')  # maxlen=9
  book = models.ForeignKey(Book, on_delete=models.CASCADE)


class IndexKingStone(models.Model):
  index = models.CharField(max_length=15, default='None')  # maxlen=13
  book = models.ForeignKey(Book, on_delete=models.CASCADE)


class IndexEslite(models.Model):
  index = models.CharField(max_length=20, default='None')  # maxlen=16
  book = models.ForeignKey(Book, on_delete=models.CASCADE)
