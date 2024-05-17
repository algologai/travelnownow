import 'package:flutter/material.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/routes/routes.dart';
import 'package:reminderapp/routes/routes_name.dart';
// ignore: unused_import
import 'package:reminderapp/splash_screen.dart';

import 'package:reminderapp/viewmodels/auth_view_model.dart';
import 'package:reminderapp/viewmodels/home_view_model.dart';
import 'package:reminderapp/viewmodels/signup_view_model.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';



void main() {
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // // Provide the LoginViewModel with LoginViewModel dependency to manage user data and API calls
        // ChangeNotifierProvider<LoginViewModel>(
        //   create: (context) => LoginViewModel(authapiService: apiService),
        // ),
         ChangeNotifierProvider(create: (_)=> AuthViewModel()),
         ChangeNotifierProvider(create: (_)=> UserViewModel()),
         ChangeNotifierProvider(create: (_)=> HomeViewModel()),
          ChangeNotifierProvider(create: (_)=> SignupViewModel()),
        
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp(
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          // home: const SplashScreen(),
          initialRoute: RoutesName.splashscreen,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
