import 'package:brasil_fields/brasil_fields.dart';
import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CarForm extends StatelessWidget {
  final controller = EditProfileController();
  final _formKey = GlobalKey<FormState>();

  CarForm({super.key});

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
                  Text('Alterar dados do veículo',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.crlvController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: Text('Alterar nº do CRLV'),
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
                    },
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                      inputFormatters: [PlacaVeiculoInputFormatter()],
                      controller: controller.placaController,
                      decoration: const InputDecoration(
                          label: Text('Alterar placa'),
                          hintText: tPlacaHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(tBorderRadius)),
                          ),
                          prefixIcon: Icon(Icons.pin_outlined)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite a placa do veículo';
                        }
                        return null;
                      }),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    controller: controller.marcaController,
                    decoration: const InputDecoration(
                      label: Text('Alterar marca'),
                      hintText: tMarcaHint,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
                      ),
                      prefixIcon: Icon(Icons.build_circle_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite a marca do veículo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.modeloController,
                    decoration: const InputDecoration(
                        label: Text('Alterar modelo'),
                        hintText: tModeloHint,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tBorderRadius)),
                        ),
                        prefixIcon: Icon(Icons.garage_outlined)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite o modelo do veículo';
                      }
                      return null; // Return null if the password is valid
                    },
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  const SizedBox(height: 30),
                  RectTextButton(
                      label: 'Confirmar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.updateCarInfoInFirestore();
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
