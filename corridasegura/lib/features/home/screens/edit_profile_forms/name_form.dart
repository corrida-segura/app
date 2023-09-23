import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/home/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameForm extends StatelessWidget {
  final controller = EditProfileController();
  final _formKey = GlobalKey<FormState>();

  NameForm({super.key});

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
                  Text('Insira seu Nome',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      label: Text('Insira seu nome'),
                      hintText: 'Insira seu nome',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
                      ),
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite o nome completo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  RectTextButton(
                    label: 'Confirmar',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.updateNameInFirestore();
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
