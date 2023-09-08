import 'package:brasil_fields/brasil_fields.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarInfoForm extends StatelessWidget {
  const CarInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final formKey = controller.formKeys[3];

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  inputFormatters: [PlacaVeiculoInputFormatter()],
                  controller: controller.placaController,
                  decoration: const InputDecoration(
                      label: Text(tPlaca),
                      hintText: tPlacaHint,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tBorderRadius)),
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
                  label: Text(tMarca),
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
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(tModelo),
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
            ],
          ),
        ),
      ),
    );
  }
}
