import 'package:corridasegura/features/home/screens/filter_preferences_forms/general_preferences.dart';
import 'package:corridasegura/features/home/screens/filter_preferences_forms/goals_preferences.dart';
import 'package:corridasegura/features/home/screens/filter_preferences_forms/region_preferences.dart';
import 'package:corridasegura/features/home/screens/home_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  static FilterController get instance => Get.find();

  final RxInt _currentStep = 0.obs;

  //Primeira página
  final localController = TextEditingController();
  final starsController = TextEditingController();
  final distanceController = TextEditingController();
  final timeController = TextEditingController();
  //Segunda página
  final blockRegionController = TextEditingController();
  final searchRegionController = TextEditingController();
  final dayPeriodController = TextEditingController();

  //Terceira página
  final goalController = TextEditingController();
  final finalDestinyController = TextEditingController();
  final RxString selectedPeriod = ''.obs;
  bool isChecked = false;

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<Step> getSteps() => [
        Step(
          content: const GeneralPreferences(),
          title: const Text(''),
          isActive: _currentStep.value >= 0,
        ),
        Step(
          content: const RegionPreferences(),
          title: const Text(''),
          isActive: _currentStep.value >= 1,
        ),
        Step(
          content: const GoalsPreferences(),
          title: const Text(''),
          isActive: _currentStep.value >= 2,
        ),
      ];

  void next() {
    if (_currentStep.value < getSteps().length - 1) {
      _currentStep.value++;
    }
  }

  int setCurrentStep(int index) {
    _currentStep.value = index;
    return _currentStep.value;
  }

  int getCurrentStep() {
    return _currentStep.value;
  }

  bool validateForm(step) {
    return formKeys[step].currentState!.validate();
  }

  Future<void> processForm(context, stepper) async {
    var currentStep = getCurrentStep();
    var totalSteps = getSteps().length;

    if (validateForm(currentStep)) {
      if (currentStep == totalSteps - 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const HomeMapPage(
                    firstTime: false,
                  )),
        );
        // Show bottom sheet with loading
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => const SizedBox(
            height: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Buscando corridas...', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        );
      } else {
        stepper.onStepContinue!();
      }
    }
  }
}
