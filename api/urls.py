from mainapp.views import AllBiodataAPI, RegisterAPI,LoginAPI,AllUsersAPI,BiodataAPI
from django.urls import path
from rest_framework.routers import DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns


# router = DefaultRouter()
# router.register('user', person, basename='person')

urlpatterns = [
    path('signup/', RegisterAPI.as_view(), name='signup'),
    path('login/', LoginAPI.as_view(), name='login'),
    path('allusers/', AllUsersAPI.as_view(), name='allusers'),
    path('biodata/<int:pk>/',BiodataAPI.as_view(),name='biodata'),
    path('allbiodata/',AllBiodataAPI.as_view(),name='allbiodata')
]

urlpatterns = format_suffix_patterns(urlpatterns)
