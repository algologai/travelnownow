from rest_framework import serializers
from django.contrib.auth.models import User

from mainapp.models import BioData

       
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    

       
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



class BiodataSerializer(serializers.Serializer):
    # user_id = serializers.CharField()
    phone = serializers.CharField()
    address = serializers.CharField()
    city = serializers.CharField()
    state = serializers.CharField()
    country = serializers.CharField()
    zip_code = serializers.CharField()
    # date_of_birth =serializers.DateField
    
    
    def create(self, validated_data):
        # biodata = BioData.objects.create(phone=validated_data['phone']
        #                                  ,address=validated_data['address']
        #                                  ,city=validated_data['city']
        #                                  ,state=validated_data['state']
        #                                  ,country=validated_data['country']
        #                                  ,zip_code=validated_data['zip_code'])
        # return validated_data
        
        return BioData.ob.create(**validated_data)
    
    
    def update(self, instance, validated_data):
            print(validated_data.get('phone',instance.phone))
            instance.phone = validated_data.get('phone',instance.phone)
            instance.address = validated_data.get('address',instance.address)
            instance.city = validated_data.get('city',instance.city)
            instance.state = validated_data.get('state',instance.state)
            instance.country = validated_data.get('country',instance.country)
            instance.zip_code = validated_data.get('zip_code',instance.zip_code)
            instance.save()
            return instance
        
    

            
    
class AllUsersSerialzer(serializers.ModelSerializer):
   
        class  Meta:
           model = User
           fields = ['username','id']
class AllBiodataSerialzer(serializers.ModelSerializer):
   
        class  Meta:
           model = BioData
           fields = '__all__'
    
       