import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:corridasegura/features/home/screens/select_region_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegionPreferences extends StatefulWidget {
  const RegionPreferences({super.key});

  @override
  State<RegionPreferences> createState() => _RegionPreferencesState();
}

class _RegionPreferencesState extends State<RegionPreferences> {
  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());
    final formKey = controller.formKeys[1];

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
                      controller: controller.blockRegionController,
                      decoration: const InputDecoration(
                        label: Text(tBlockRegion),
                        hintText: tBlockRegionHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(tBorderRadius),
                          ),
                        ),
                        prefixIcon: Icon(Icons.location_off_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o bairro';
                        }
                        return null;
                      }
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(
                        () {
                          Get.to(() => const SelectRegionPage(
                                firstTime: false,
                              ))?.then(
                            (value) => {
                              controller.blockRegionController.text =
                                  value ?? ''
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: tFormHeight - 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.searchRegionController,
                      decoration: const InputDecoration(
                        label: Text(tSearchRegion),
                        hintText: tSearchRegionHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(tBorderRadius)),
                        ),
                        prefixIcon: Icon(Icons.location_on_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o bairro';
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
                        ))?.then((value) => {
                              controller.searchRegionController.text = value ?? ''
                            });
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: tFormHeight - 20),
              DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Diurno', child: Text('Diurno')),
                    DropdownMenuItem(value: 'Noturno', child: Text('Noturno')),
                  ],
                  decoration: const InputDecoration(
                    labelText: tDayPeriod,
                    hintText: tDayPeriodHint,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.schedule_outlined),
                  ),
                  onChanged: (value) {
                    controller.selectedPeriod.value = value!;
                  }),
              const SizedBox(height: tFormHeight - 20),
            ],
          ),
        ),
      ),
    );
  }
}
