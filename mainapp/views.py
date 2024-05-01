from rest_framework.response import Response
from mainapp.serializers import LoginSerializer, RegisterSerializer,AllUsersSerialzer
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
from  django.contrib.auth  import authenticate
# from rest_framework.permissions import IsAuthenticated
# from rest_framework.authentication import TokenAuthentication, BasicAuthentication
from rest_framework.authtoken.models import Token


class LoginAPI(APIView):
    def post(self, request):
        token = 0
        data = request.data
        serializer = LoginSerializer(data=data)
        if serializer.is_valid():
            username = serializer.data['username']
            password = serializer.data['password']
            user = authenticate(username=username, password=password)
        
            if user:
                token, _ = Token.objects.get_or_create(user=user)
             
                return Response({'status':True,'message':'Login success','token':str(token)}, status=status.HTTP_200_OK)
            
            else:
                return Response({'status':False,'message':'Login failed','token':str(token)}, status=status.HTTP_200_OK)
        else:
            return Response({'status':False,'message':serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
    
    
class RegisterAPI(APIView):
    def post(self, request):
        data = request.data
        serializer = RegisterSerializer(data=data)
        if serializer.is_valid():
            username = serializer.data['username']
            email = serializer.data['email']
            password = serializer.data['password']
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            return Response({'status': True,'message':'User created'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'status':False,'message':serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
        
        
        
class AllUsersAPI(APIView):
    def get(self, request):
       obj = User.objects.all()
       serializer = AllUsersSerialzer(obj, many=True) 
       return Response({'status': True,'data':serializer.data}, status=status.HTTP_201_CREATED)
        
    
        
    

   
