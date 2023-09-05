import 'package:corridasegura/features/authentication/screens/signup/sign_up_page_four.dart';
import 'package:corridasegura/features/authentication/screens/signup/sign_up_page_three.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_page_one.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_page_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  
  final RxInt _currentStep = 0.obs;
  PageController pageController = PageController();
  bool isChecked = false;

  //Add TextEditingControllers 
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final cnhController = TextEditingController();
  final clrvController = TextEditingController();


  List<Step> getSteps() => [
    Step(
      content: const SignUpPageOne(), title: const Text(''), isActive: _currentStep.value >=0,
    ),
    Step(
      content: const SignUpPageTwo(), title: const Text(''), isActive: _currentStep.value >=1,
    ),
    Step(
      content: const SignUpPageThree(), title: const Text(''), isActive: _currentStep.value >=2,
    ),
    Step(
      content: const SignUpPageFour(), title: const Text(''), isActive: _currentStep.value >=3,
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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}