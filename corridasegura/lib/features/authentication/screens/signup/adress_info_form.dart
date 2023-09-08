import 'package:corridasegura/common/profile_image.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Implementar integração com o cloud storage para armazenar a foto de perfil

class AdressInfoForm extends StatefulWidget {
  const AdressInfoForm({Key? key}) : super(key: key);

  @override
  State<AdressInfoForm> createState() => _AdressInfoFormState();
}

class _AdressInfoFormState extends State<AdressInfoForm> {
  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final formKey = controller.formKeys[4];
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(
                    label: Text(tAdress),
                    hintText: tAdressHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.house_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite o endereço';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              Center(
                child: Text(tImageRequest,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              const SizedBox(height: 20),
              const Center(child: ProfileImage()),
              const SizedBox(height: 30),
              Row(
                children: [
                  Checkbox(
                    value: controller.isChecked,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          controller.isChecked = value!;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      
                      tAcceptConditions,
                      softWrap: true,
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
