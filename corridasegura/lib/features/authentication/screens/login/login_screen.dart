import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/authentication/screens/login/login_form_widget.dart';
import 'package:corridasegura/features/authentication/screens/login/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}