import 'package:corridasegura/features/authentication/screens/signup/sign_up_page_four.dart';
import 'package:corridasegura/features/authentication/screens/signup/sign_up_page_three.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_page_one.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_page_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final RxInt _currentStep = 0.obs;

  //Primeira página
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //Segunda página
  final cpfController = TextEditingController();
  final cnhController = TextEditingController();
  final crlvController = TextEditingController();
  //Terceira página
  final RxString selectedBank = ''.obs;
  final agController = TextEditingController();
  final contaController = TextEditingController();
  //Quarta página
  final addressController = TextEditingController();
  bool isChecked = false;

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<Step> getSteps() => [
        Step(
          content: const SignUpPageOne(),
          title: const Text(''),
          isActive: _currentStep.value >= 0,
        ),
        Step(
          content: const SignUpPageTwo(),
          title: const Text(''),
          isActive: _currentStep.value >= 1,
        ),
        Step(
          content: const SignUpPageThree(),
          title: const Text(''),
          isActive: _currentStep.value >= 2,
        ),
        Step(
          content: const SignUpPageFour(),
          title: const Text(''),
          isActive: _currentStep.value >= 3,
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

  void registerUser(String email, String password) {
    
  }

  bool formValidation(step) {
    return formKeys[step].currentState!.validate();
  }

  void processForm(context, stepper) {
    var currentStep = getCurrentStep();
    var stepsLength = getSteps().length;
  
    if (formValidation(currentStep)) {
      if (currentStep == stepsLength - 1) {
        if (!isChecked) {
          showAlertDialog(
            context,
            'É necessário aceitar os termos e condições',
          );
          return;
        }
        registerUser(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
      } else {
        stepper.onStepContinue!();
      }
    }
  }

  void showAlertDialog(BuildContext context, String message) {
  showDialog(
    //TODO: Mudar estilo do popup
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
}
