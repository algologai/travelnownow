from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def index(request):
    courses = {
        'course_name':'python',
        'learn':{'flask','django','php','java'},
        'course_provider':'Qudroid'
      }
    
    
    if request.method == 'GET':
        print("this is get method")
        return Response(courses) 
    if request.method == 'POST':
        return Response(courses)
    if request.method == 'PUT':
        return Response(courses)
    if request.method == 'POST':
        return Response(courses)