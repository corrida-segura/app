import 'package:brasil_fields/brasil_fields.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserDocsForm extends StatelessWidget {
  const UserDocsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final formKey = controller.formKeys[1];
    final maskCpf = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.cpfController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text(tCPF),
                  hintText: tCPFHint,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                inputFormatters: [maskCpf],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o CPF';
                  }
                  if (UtilBrasilFields.isCPFValido(value) == false) {
                    return 'Por favor, digite um CPF válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.cnhController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text(tCNH),
                    hintText: tCNHHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.drive_eta_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite a CNH';
                    }
                    if (value.length != 11) {
                      return 'Por favor, digite uma CNH válida';
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.crlvController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text(tCRLV),
                    hintText: tCRLVHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.no_crash_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o CRLV';
                    }
                    if (value.length != 11) {
                      return 'Por favor, digite um CRLV válido';
                    
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 10),
            ],
          ),
        ),
      ),
    );
  }
}
