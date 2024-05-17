// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/routes/routes_name.dart';
import 'package:reminderapp/slider.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/views/screens/home_screen.dart';
import 'package:reminderapp/views/screens/login.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext) =>  SplashScreen());
      
      case RoutesName.introslider:
        return MaterialPageRoute(
            builder: (BuildContext) =>  IntroSlider());


      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext) =>  HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext) => const LogInScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}
