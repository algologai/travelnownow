import 'package:flutter/material.dart';
import 'package:reminderapp/views/screens/login.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';
import 'package:reminderapp/views/widgets/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 250,
            ),
            Text(
              'Reset Password',
              style: titleText,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const ResetForm(),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LogInScreen(),
                      ));
                },
                child: const SizedBox(
                  height: 47,
                  child: PrimaryButton(buttonText: 'Reset Password'))),
          ],
        ),
        
      ),
    );
  }
}
