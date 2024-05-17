// ignore_for_file: library_private_types_in_public_api

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/slider.dart';
import 'package:reminderapp/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.scale(
          useImmersiveMode: true,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
          childWidget: SizedBox(
            height: 150,
            child: Image.asset("images/man.png"),
          ),
          // duration: const Duration(milliseconds: 2500),
          // animationDuration: const Duration(milliseconds: 2000),
          // // onAnimationEnd: () => debugPrint("On Scale End"),
          // nextScreen: const IntroSlider(),
        ),
      ),
    );
  }
}
