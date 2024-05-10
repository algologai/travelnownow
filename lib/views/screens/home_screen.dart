import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/splash_screen.dart';
import 'package:reminderapp/utils/utils.dart';
import 'package:reminderapp/viewmodels/user_view_model.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          SizedBox(
              height: 50,
              width: 130,
              child: GestureDetector(
                  onTap: () {
                    userPreference.removeUser().then((value) {
                       Utils.flushBarErrorMessage(
                        "End User Session", "You Have Logged out", context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    });
                 
                    
                  },
                  child: const PrimaryButton(buttonText: "log out"))),
          SizedBox(
              height: 50,
              width: 200,
              child: GestureDetector(
                  onTap: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()));
                  },
                  child: const PrimaryButton(
                      buttonText: "back to splash screen"))),
   
          const Center(
            child: Text("welcome home"),
          ),
        ],
      ),
    );
  }
}
