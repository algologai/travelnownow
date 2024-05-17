import 'package:flutter/cupertino.dart';
import 'package:reminderapp/models/userlogin/user_login_success.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel with ChangeNotifier {
  bool _welcomeMsg = false;
  late String _username;
  

  bool get welcomeMsg => _welcomeMsg;
  

  //getters
  String get username => _username;

  //setters
  setUsername(String username) {
    _username = username;
  }


  setWelcomeMsg(bool value) {
    _welcomeMsg = value;
    notifyListeners();
  }

  void displayMsg() {
    setWelcomeMsg(true);
  }

  void back(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.splashscreen);
  }

  void getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _username = sp.getString('token')!;
 
  }
}
