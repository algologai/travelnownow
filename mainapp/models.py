from django.db import models
from django.contrib.auth.models import User

class Person(models.Model):
    # first_name = models.CharField(max_length=30)
    # last_name = models.CharField(max_length=30)
    # email = models.EmailField(max_length=254)
    # phone = models.CharField(max_length=15)
    # address = models.CharField(max_length=100)
    # city = models.CharField(max_length=30)
    # state = models.CharField(max_length=30)
    # country = models.CharField(max_length=30)
    # zip_code = models.CharField(max_length=10)
    # date_of_birth = models.DateField
    
    name = models.CharField(max_length=30)
    age = models.IntegerField()


class BioData(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE,related_name="user",null=True)
    phone = models.CharField(max_length=15,null=True)
    address = models.CharField(max_length=100,null=True)
    city = models.CharField(max_length=30,null=True)
    state = models.CharField(max_length=30,null=True)
    country = models.CharField(max_length=30,null=True)
    zip_code = models.CharField(max_length=10,null=True)
    date_of_birth = models.DateField(null=True)
    