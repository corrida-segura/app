import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:corridasegura/features/authentication/screens/signup/adress_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/bank_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/car_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/user_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/user_docs_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final placaController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  //Quinta página
  final addressController = TextEditingController();
  bool isChecked = false;

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  List<Step> getSteps() => [
        Step(
          content: const SignUpUserInfo(),
          title: const Text(''),
          isActive: _currentStep.value >= 0,
        ),
        Step(
          content: const UserDocsForm(),
          title: const Text(''),
          isActive: _currentStep.value >= 1,
        ),
        Step(
          content: const BankInfoForm(),
          title: const Text(''),
          isActive: _currentStep.value >= 2,
        ),
        Step(
          content: const CarInfoForm(),
          title: const Text(''),
          isActive: _currentStep.value >= 3,
        )
        ,
        Step(
          content: const AdressInfoForm(),
          title: const Text(''),
          isActive: _currentStep.value >= 4,
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

  Future<bool> userExists() async {
    var query = await FirebaseFirestore.instance
        .collection('motoristas')
        .where(Filter.or(
            Filter('email', isEqualTo: emailController.text.trim()),
            Filter('cpf', isEqualTo: cpfController.text.trim())))
        .get();

    if (query.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  registerUser() async {
  if (await userExists()) {
    Get.defaultDialog(
        title: 'Erro', middleText: 'Email ou CPF já cadastrado');
  } else {
    var userId = await Get.find<AuthController>().signUpEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    // Add user info to 'users' subcollection
    FirebaseFirestore.instance.collection('motoristas').doc(userId).collection('dados pessoais').doc(userId).set(
      {
        'nome': nameController.text,
        'email': emailController.text,
        'CPF': cpfController.text,
        'CNH': cnhController.text,
        'endereco': addressController.text,
      },
    );

    // Add bank info to 'bank' subcollection
    FirebaseFirestore.instance.collection('motoristas').doc(userId).collection('banco').doc(userId).set(
      {
        'banco': selectedBank.value,
        'agencia': agController.text,
        'conta': contaController.text,
      },
    );

    // Add car info to 'car' subcollection
    FirebaseFirestore.instance.collection('motoristas').doc(userId).collection('carro').doc(userId).set(
      {
        'CRLV': crlvController.text,
        'placa': placaController.text,
        'marca': marcaController.text,
        'modelo': modeloController.text,

      },
    );

    Get.defaultDialog(
        title: 'Falta pouco!',
        middleText: 'Para concluir o cadastro, é necessário preencher suas preferências.');
  }
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
          Get.defaultDialog(
              title: 'Erro',
              middleText:
                  'Você precisa aceitar os termos de uso para prosseguir');

          return;
        }
        registerUser();
      } else {
        stepper.onStepContinue!();
      }
    }
  }
}
