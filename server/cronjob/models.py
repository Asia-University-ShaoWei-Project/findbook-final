from django.db import models

# Create your models here.


class Bestseller(models.Model):
  page = models.CharField(max_length=2, null=True)
  isbn = models.CharField(max_length=13)
  name = models.CharField(max_length=130)
  price = models.CharField(max_length=4, null=True)
  img_url = models.CharField(max_length=130)
  created = models.DateTimeField(auto_now=True)

  def __str__(self):
    return self.isbn
