import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BankForm extends StatelessWidget {
  final controller = EditProfileController();
  final _formKey = GlobalKey<FormState>();

  BankForm({super.key});

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
                  Text('Alterar dados bancários',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Bank A', child: Text('Bank A')),
                    DropdownMenuItem(value: 'Bank B', child: Text('Bank B')),
                    DropdownMenuItem(value: 'Bank C', child: Text('Bank C')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Selecione seu banco',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.account_balance),
                  ),
                  onChanged: (value) {
                    controller.selectedBank.value = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecione seu banco';
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.agController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: tAgencia,
                    hintText: tAgenciaHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.business),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite a agência';
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.contaController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: tConta,
                    hintText: tContaHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o número da conta';
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 10),
                  const SizedBox(height: 30),
                  RectTextButton(
                      label: 'Confirmar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.updateBankInfoInFirestore();
                          Get.back();
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
