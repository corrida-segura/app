import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordForm extends StatelessWidget {
  final controller = EditProfileController();
  final _formKey = GlobalKey<FormState>();

  PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LeftArrowButton(text: 'Voltar', onTap: () => Get.back()),
                  const SizedBox(height: 30),
                  Text('Alterar senha',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: controller.oldPasswordController,
                    decoration: const InputDecoration(
                      label: Text('Insira sua antiga senha'),
                      hintText: 'Insira sua antiga senha',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
                      ),
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite sua antiga senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.newPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text('Insira sua nova senha'),
                        hintText: tPasswordHint2,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tBorderRadius)),
                        ),
                        prefixIcon: Icon(Icons.fingerprint)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite a senha';
                      }
                      if (value.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Pelo menos uma letra maiúscula';
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'A senha deve conter pelo menos um caractere especial';
                      }
                      return null; // Return null if the password is valid
                    },
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Confirme sua nova senha'),
                      hintText: tPasswordHint2,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
                      ),
                      prefixIcon: Icon(Icons.fingerprint),
                    ),
                    validator: (value) =>
                        value == controller.newPasswordController.text
                            ? null
                            : 'As senhas devem ser iguais',
                  ),
                  const SizedBox(height: 30),
                  RectTextButton(
                      label: 'Confirmar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.updatePasswordInFirebase();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
