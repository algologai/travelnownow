from mainapp.views import RegisterAPI,LoginAPI,AllUsersAPI
from django.urls import path
from rest_framework.routers import DefaultRouter

# router = DefaultRouter()
# router.register('user', person, basename='person')

urlpatterns = [
    path('createuser/', RegisterAPI.as_view(), name='createuser'),
    path('login/', LoginAPI.as_view(), name='login'),
    path('allusers/', AllUsersAPI.as_view(), name='allusers')
]
