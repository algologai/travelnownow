// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/app_loading.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/auth_view_model.dart';
import 'package:reminderapp/views/screens/reset_password.dart';
import 'package:reminderapp/views/screens/signup.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/views/widgets/login_option.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // Declare the TextEditingControllers at the class level
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void disposed() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    bool _isObscure = true;
    final formKey = GlobalKey<FormState>();
    //final loginviewModel = Provider.of<LoginViewModel>(context);

    Map<String, IconData> iconMapping = {
      'person': Icons.person,
      'password': Icons.password,
    };

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text(
                    'Welcome',
                    style: titleText,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 100,
                    child: Center(
                        child: Image.asset(
                      'images/login logo.png',
                    ))),
                if (authViewModel.isLoading) const AppLoading(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Field required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: kTextFieldColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      fillColor: Colors.grey,
                      filled: false,
                      prefixIcon: Icon(iconMapping['person']!),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Field required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: false,
                        prefixIcon: Icon(iconMapping['password']!),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        suffixIcon: true
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: true
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: kTextFieldColor,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: kPrimaryColor,
                                      ),
                              )
                            : null),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen()));
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: kZambeziColor,
                      fontSize: 14,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_usernameController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Error", "Please Enter Username", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Error", "Please Enter  password ", context);
                    } else if (_passwordController.text.length < 4) {
                      Utils.flushBarErrorMessage(
                          "Error", "Password must be 6 or more", context);
                    } else {
                      Map data = {
                        "username": _usernameController.text.toString(),
                        "password": _passwordController.text.toString(),
                      };

                      authViewModel.loginApi(data, context);
                      print("api hit");
                    }
                  },
                  child: const SizedBox(
                    height: 49,
                    child: PrimaryButton(
                      buttonText: 'Log In',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Not Registered ?',
                      style: subTitle,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: textButton.copyWith(
                          decorationThickness: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Or log in with:',
                  style: subTitle.copyWith(color: kBlackColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: LoginOption(),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
