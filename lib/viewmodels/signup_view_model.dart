import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/data/response/status.dart';
import 'package:reminderapp/helper/app_status.dart';
import 'package:reminderapp/models/signup/signupErrorResponse.dart';
import 'package:reminderapp/repository/signup_repository.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/utils/utils.dart';

class SignupViewModel with ChangeNotifier {
  final _myRepo = SignupRepository();
  late SignupErrorResponse _signupErrorResponse;
  

  String? _loginError; // Error message in case the login process fails.
  bool _isLoading =
      false; // A flag to track the loading state during the login process.

  // Getters to access the error message and loading state.
  String? get loginError => _loginError;
  bool get isLoading => _isLoading;
  SignupErrorResponse get signupErrorResponse => _signupErrorResponse;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setSignupErrorModel(SignupErrorResponse signupErrorResponse) {
    _signupErrorResponse = signupErrorResponse;
  }



  Future<void> signupApi(dynamic data, BuildContext context) async {
  
    setLoading(true);
    _myRepo.signupApi(data).then((value) {
      setLoading(false);
      //print(value.runtimeType);
      if (value is Success) {
          Navigator.pushNamed(context, RoutesName.home);
          Utils.flushBarSuccessMessage(
              "Success", "Welcome to TravelnownoW App", context);
      } else if (value is Failure) {
        setSignupErrorModel(value.errorResponse as SignupErrorResponse);
        String errMsg =_signupErrorResponse.message!.nonFieldErrors!.join(',');
        Utils.flushBarErrorMessage("Signup Failed", errMsg.toString(), context);
      }
   
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage("Failed", error.toString(), context);
    });
  }
}
