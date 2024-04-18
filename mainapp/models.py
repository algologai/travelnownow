from django.db import models

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