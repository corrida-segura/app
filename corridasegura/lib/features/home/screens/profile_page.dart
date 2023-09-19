import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:corridasegura/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await AuthController.instance.signOut();
            Get.offAll(() => const LoginScreen());
          },
          child: const Text('Logout')),
    );
  }
}
