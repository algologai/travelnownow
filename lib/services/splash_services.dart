import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';

class SplashServices {
  Future<UserLoginSuccessl> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token);
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.introslider);
      } else {
        print(value.token);
        await Future.delayed(const Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        // print(error.toString());
      }
    });
  }
}
