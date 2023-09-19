import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_forms/adress_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_forms/bank_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_forms/car_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_forms/user_info_form.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_forms/user_docs_form.dart';
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
        ),
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

  Future<bool> cpfExists() async {
    var query = await FirebaseFirestore.instance
        .collection('motoristas')
        .where(Filter('cpf', isEqualTo: cpfController.text.trim()))
        .get();

    return query.docs.isEmpty;
  }

  registerUser() async {
    var userData = {
      'dados_pessoais': {
        'nome': nameController.text,
        'email': emailController.text,
        'CPF': cpfController.text,
        'CNH': cnhController.text,
        'endereco': addressController.text,
      },
      'dados_banco': {
        'banco': selectedBank.value,
        'agencia': agController.text,
        'conta': contaController.text,
      },
      'dados_carro': {
        'CRLV': crlvController.text,
        'placa': placaController.text,
        'marca': marcaController.text,
        'modelo': modeloController.text,
      },
    };

    try {
      await Get.find<AuthController>().signUpEmail(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          userData: userData);
    } catch (e) {
      Get.defaultDialog(title: 'Erro', middleText: e.toString());
    }
  }
  //TODO: Limpar os forms

  bool validateForm(step) {
    return formKeys[step].currentState!.validate();
  }

  Future<void> processForm(context, stepper) async {
    var currentStep = getCurrentStep();
    var totalSteps = getSteps().length;
    bool cpfMatch = true;


    if (validateForm(currentStep)) {
      if (currentStep == totalSteps - 1) {
        cpfMatch = await cpfExists();
        if (!isChecked) {
          Get.defaultDialog(
              title: 'Erro',
              middleText:
                  'Você precisa aceitar os termos de uso para prosseguir');
        } else if (cpfMatch) {
          Get.defaultDialog(
              title: 'Erro', middleText: 'CPF já cadastrado');
        } else {
          registerUser();
        }
      } else {
        stepper.onStepContinue!();
      }
    }
  }
}
