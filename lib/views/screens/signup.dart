// ignore_for_file: unused_import, dead_code
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/app_loading.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/signup_view_model.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/views/widgets/checkbox.dart';
import 'package:reminderapp/views/widgets/login_option.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';
import 'package:reminderapp/views/widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Declare the TextEditingControllers at the class level
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void disposed() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupviewmodel = Provider.of<SignupViewModel>(context);
    bool _isObscure = true;
    final formKey = GlobalKey<FormState>();

    Map<String, IconData> iconMapping = {
      'person': Icons.person,
      'email': Icons.email,
      'phone': Icons.phone,
      'password': Icons.password,
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Row(
                  children: [
                    Text(
                      'Already registered?',
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
                                builder: (context) => const LogInScreen()));
                      },
                      child: Text(
                        'Log In',
                        style: textButton.copyWith(
                          decorationThickness: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: 200,
                  child: Center(
                      child: Image.asset(
                    'images/signup logo.png',
                  ))),
              if (signupviewmodel.isLoading) const AppLoading(),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: kTextFieldColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: false,
                        prefixIcon: Icon(iconMapping['email']!),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        hintText: 'Username',
                        hintStyle: const TextStyle(color: kTextFieldColor),
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
                    )),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: kTextFieldColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: false,
                        prefixIcon: Icon(iconMapping['password']!),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          color: kTextFieldColor,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(color: kTextFieldColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: false,
                        prefixIcon: Icon(iconMapping['password']!),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: kDefaultPadding,
                child: CheckBox('Agree to terms and conditions.'),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: kDefaultPadding,
                child: SizedBox(
                    height: 49,
                    child: GestureDetector(
                        onTap: () {
                          if (_emailController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Error", "Please Enter correct email", context);
                          } else if (_usernameController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Error", "Please enter username", context);
                          } else if (_passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessage("Error",
                                "Please Enter  confirm password ", context);
                          } else if (_confirmPasswordController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Error", "Please enter Password", context);
                          } else if (_passwordController.text.length < 4) {
                            Utils.flushBarErrorMessage(
                                "Error", "Password must be 6 or more", context);
                          } else if (_confirmPasswordController.text.length <
                              4) {
                            Utils.flushBarErrorMessage("Error",
                                "Confirm Password must be 6 or more", context);
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            Utils.flushBarErrorMessage(
                                "Error", "Passwords do not match", context);
                          } else {
                            Map data = {
                              "username": _usernameController.text.toString(),
                              "email": _emailController.text.toString(),
                              "password": _passwordController.text.toString(),
                            };
                            //print(data);
                            signupviewmodel.signupApi(data, context);
                          }
                        },
                        child: const PrimaryButton(buttonText: 'Sign Up'))),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: kDefaultPadding,
                // child: Text(
                //   'Or log in with:',
                //   style: subTitle.copyWith(color: kBlackColor),
                // ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: kDefaultPadding,
                child: LoginOption(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
