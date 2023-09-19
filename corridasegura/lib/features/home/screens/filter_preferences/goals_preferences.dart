import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalsPreferences extends StatefulWidget {
  const GoalsPreferences({super.key});

  @override
  State<GoalsPreferences> createState() => _GoalsPreferencesState();
}

class _GoalsPreferencesState extends State<GoalsPreferences> {
  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());
    final formKey = controller.formKeys[2];
    return SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.goalController,
                      decoration: const InputDecoration(
                        label: Text(tGoal),
                        hintText: tGoalHint,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tBorderRadius)),
                        ),
                        prefixIcon: Icon(Icons.flag_outlined),
                      ),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      controller: controller.finalDestinyController,
                      decoration: const InputDecoration(
                        label: Text(tFinalDestiny),
                        hintText: tFinalDestinyHint,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tBorderRadius)),
                        ),
                        prefixIcon: Icon(Icons.location_city_outlined),
                      ),
                    ),
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
                            tDynamicAreasCheck,
                            softWrap: true,
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
