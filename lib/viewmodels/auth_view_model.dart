import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reminderapp/repository/auth_repository.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  String? _loginError; // Error message in case the login process fails.
  bool _isLoading =
      false; // A flag to track the loading state during the login process.

  // Getters to access the error message and loading state.
  String? get loginError => _loginError;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarSuccessMessage("Success", "Login Successful", context);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (error.toString().contains('status')) {
        Utils.flushBarErrorMessage("Login Failed", "Invalid Login Details", context);
      } else {
        Utils.flushBarErrorMessage("Failed", error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      }
    });
  }
}
