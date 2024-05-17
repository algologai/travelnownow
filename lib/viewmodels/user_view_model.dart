// ignore_for_file: unnecessary_import, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
 
  Future<bool> saveUser(UserLoginSuccessl userLoginSuccessl) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userLoginSuccessl.token.toString());
    sp.setString('username', userLoginSuccessl.username.toString());
    notifyListeners();
    return true;
  }

  Future<UserLoginSuccessl> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? username = sp.getString('username');
    // print(token.toString());
    return UserLoginSuccessl(
        username: username.toString(), token: token.toString());
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.remove('username');

    return true;
  }
}
