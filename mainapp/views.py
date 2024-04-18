from rest_framework.decorators import api_view
from rest_framework.response import Response
from mainapp.models import Person
from mainapp.serializers import PeopleSerializer

@api_view(['GET','POST','PUT','DELETE'])
def index(request):
    courses = {
        'course_name':'python',
        'learn':{'flask','django','php','java'},
        'course_provider':'Qudroid'
      }
    if request.method == 'GET':
      print(request.GET.get('search'))
      print('GET request')
      return Response(courses)
    if request.method == 'POST':
      data = request.data
      print("***********")
      print('data:',data)
      return Response(data)
    if request.method == 'PUT':
      print('put request')
      return Response(courses)
    if request.method == 'DELETE':
      print('delete request')
      return Response(courses)
    
@api_view(['GET','POST','PUT','PATCH'])
def person(request):
   if request.method == 'GET':
      objs = Person.objects.all()  
      serializer = PeopleSerializer(objs,many=True)
      return Response(serializer.data) 
   elif request.method == 'PUT':
      data = request.data
      serializer = PeopleSerializer(data=data)
      if serializer.is_valid():
          serializer.save()
          return Response(serializer.data)
   elif request.method == 'PATCH':
      data = request.data
      serializer = PeopleSerializer(data=data,partial=True)
      if serializer.is_valid():
          serializer.save()
          return Response(serializer.data)
      
    
      
      return Response(serializer.errors)
  
   