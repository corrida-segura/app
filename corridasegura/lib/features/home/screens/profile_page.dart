import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/common/profile_image.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/adress_form.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/car_form.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/delete_account.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/email_form.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/name_form.dart';
import 'package:corridasegura/features/home/screens/edit_profile_forms/password_form.dart';
import 'package:corridasegura/features/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_profile_forms/bank_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final stars = '4.5';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('motoristas')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(tDefaultSize + 20),
                child: Column(
                  children: [
                    LeftArrowButton(
                      text: 'Voltar',
                      onTap: () => Get.offAll(() => const HomeScreen()),
                    ),
                    const SizedBox(height: 15),
                    const ProfileImage(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 5),
                        Text(stars)
                      ],
                    ),
                    const SizedBox(height: 15),
                    UserDataEditButton(
                        label: 'Nome',
                        data: snapshot.data!['dados_pessoais']['nome'],
                        onTap: () => Get.to(NameForm())),
                    UserDataEditButton(
                        label: 'Alterar email',
                        data: snapshot.data!['dados_pessoais']['email'],
                        onTap: () => Get.to(EmailForm())),
                    UserDataEditButton(
                        label: 'Alterar endereço',
                        onTap: () => Get.to(AdressForm())),
                    UserDataEditButton(
                        label: 'Alterar dados do veiculo',
                        onTap: () => Get.to(CarForm())),
                    UserDataEditButton(label: 'Alterar dados bancários',
                    onTap: () => Get.to(BankForm())),
                    UserDataEditButton(label: 'Alterar senha',
                    onTap: () => Get.to(PasswordForm())),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const DeleteAccount()),
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFF1A1E23)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(tBorderRadius),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Excluir minha conta',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}






/* Center(
      child: ElevatedButton(
          onPressed: () async {
            await AuthController.instance.signOut();
            Get.offAll(() => const LoginScreen());
          },
          child: const Text('Logout')),
    ); */