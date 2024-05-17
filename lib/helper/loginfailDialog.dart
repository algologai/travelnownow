
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('login Fails'),
          content: const Text('Invalid Login Details',style: TextStyle(color: Colors.red),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Try Again'),
            ),
          ],
        );
      },
    );
 }