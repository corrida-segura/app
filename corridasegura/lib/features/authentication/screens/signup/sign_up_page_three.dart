import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpPageThree extends StatelessWidget {
  const SignUpPageThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final SignUpController controller = Get.put(SignUpController());
    final formKey = controller.formKeys[2];
    

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(
                    value: 'Bank A',
                    child: Text('Bank A'),
                  ),
                  DropdownMenuItem(
                    value: 'Bank B',
                    child: Text('Bank B'),
                  ),
                  DropdownMenuItem(
                    value: 'Bank C',
                    child: Text('Bank C'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Instituição Financeira',
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
                    return 'Por favor, selecione uma instituição financeira';
                  }
                  return null;
                }
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.agController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Agência',
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
                }
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.contaController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Conta',
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
                }
              ),
              const SizedBox(height: tFormHeight - 10),
            ],
          ),
        ),
      ),
    );
  }
}