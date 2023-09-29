import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:corridasegura/features/home/screens/select_region_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralPreferences extends StatefulWidget {
  const GeneralPreferences({super.key});

  @override
  State<GeneralPreferences> createState() => _GeneralPreferencesState();
}

class _GeneralPreferencesState extends State<GeneralPreferences> {
  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());
    final formKey = controller.formKeys[0];

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.localController,
                      decoration: const InputDecoration(
                        labelText: tLocation,
                        hintText: tLocation,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(tBorderRadius),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a localização';
                        }
                        return null;
                      }
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        Get.to(() => const SelectRegionPage(
                                  firstTime: false,
                                ))
                            ?.then((value) =>
                                controller.localController.text = value ?? '');
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.starsController,
                decoration: const InputDecoration(
                  label: Text(tStars),
                  hintText: tStarsHint,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.star_border_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a quantidade de estrelas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.distanceController,
                decoration: const InputDecoration(
                  label: Text(tDistance),
                  hintText: tDistanceHint,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.map_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a distância';
                  }
                  return null;
                },
              ),
              Slider(
                value: controller.distanceController.text.isNotEmpty ? double.parse(controller.distanceController.text) : 1,
                onChanged: (newValue) {
                  // Update the value of the distance controller
                  setState(() {
                    controller.distanceController.text = newValue.toStringAsFixed(1);
                  });
                },
                min: 1,
                max: 100,
                divisions: 99,
                label: controller.distanceController.text,
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.timeController,
                decoration: const InputDecoration(
                  label: Text(tTime),
                  hintText: tTimeHint,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.timer_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o tempo';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
