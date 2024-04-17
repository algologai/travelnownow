from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def index(request):
    courses = {
        'course_name':'python',
        'learn':{'flask','django','php','java'},
        'course_provider':'Qudroid'
      }
    
    return Response(courses)  