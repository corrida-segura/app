import 'package:brasil_fields/brasil_fields.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPageTwo extends StatelessWidget {
  const SignUpPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(tCPF),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
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
                decoration: const InputDecoration(
                  label: Text(tCNH),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.drive_eta_outlined),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(tCLRV),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.no_crash_outlined),
                ),
              ),
              const SizedBox(height: tFormHeight - 10),
            ],
          ),
        ),
      ),
    );
  }
}
