import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/authentication/screens/login/login_form.dart';
import 'package:corridasegura/features/authentication/screens/login/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return Scaffold(
      body: DecoratedBox(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF050B16),
              Color(0xFF050B16),
              Color(0xFF000000),
              Color(0xFF000000),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Expanded(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeader(),
                    LoginForm(),
                    SizedBox(
                      height: double.maxFinite,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
