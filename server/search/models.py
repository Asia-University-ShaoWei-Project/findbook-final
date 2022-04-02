from django.db import models

import jsonfield


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
