import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed:() async{
          await AuthController.instance.signOut();
          Get.offAll(() => const LoginScreen());
        } , child: const Text('Logout')),
      )
    );
  }
}