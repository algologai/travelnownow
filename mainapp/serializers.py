from rest_framework import serializers
from django.contrib.auth.models import User

       
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    
    # def validate(self,data):
    #     if data['username'] and data['password']:
    #         if User.objects.filter(username=data['username'],password=data['password']).exists():
    #             return data
    #         else:
    #             raise serializers.ValidationError('Invalid username or password')
    #     else:
    #         raise serializers.ValidationError('username and password are required')
        
    # def create(self,validated_data):
    #     return validated_data
    
    # def update(self,instance,validated_data):
    #     instance.username = validated_data.get('username',instance.username)
    #     instance.password = validated_data.get('password',instance.password)
    #     instance.save()
    #     return instance
    
       
class RegisterSerializer(serializers.Serializer):
    email = serializers.EmailField()
    username = serializers.CharField()
    password = serializers.CharField()
    
    def validate(self, data):
        if data['username']:
            if User.objects.filter(username=data['username']).exists():
                raise serializers.ValidationError('Username already choosen')
            
        if data['email']:
            if User.objects.filter(email=data['email']).exists():
                raise serializers.ValidationError('Email already choosen')
            
        return data
        
         
        
    def create(self,validated_data):
       user = User.objects.create(username=validated_data['username'],email=validated_data['email'],password=validated_data['password'])
       user.set_password(validated_data['password'])  
    #    user.save()
    #    print(validated_data['password']) 
       return validated_data
      
    
    
    def update(self,instance,validated_data):
        instance.username = validated_data.get('username',instance.username)
        instance.password = validated_data.get('password',instance.password)
        instance.save()
        return instance


class AllUsersSerialzer(serializers.ModelSerializer):
   
        class  Meta:
           model = User
           fields = ['username']
    
    
       