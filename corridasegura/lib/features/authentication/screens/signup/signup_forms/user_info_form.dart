import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpUserInfo extends StatelessWidget {
  const SignUpUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final formKey = controller.formKeys[0];

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                      label: Text(tFullName),
                      hintText: tFullNameHint,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
                      ),
                      prefixIcon: Icon(Icons.person_outline_rounded)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o nome completo';
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  label: Text(tEmail),
                  hintText: tEmailHint2,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return tInvalidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(tPassword),
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
              
            ],
          ),
        ),
      ),
    );
  }
}