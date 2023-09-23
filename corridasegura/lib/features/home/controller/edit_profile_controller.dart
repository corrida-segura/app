import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();
  final user = FirebaseAuth.instance.currentUser;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final crlvController = TextEditingController();
  final RxString selectedBank = ''.obs;
  final agController = TextEditingController();
  final contaController = TextEditingController();
  final placaController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();

  Future<void> updateNameInFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('motoristas')
          .doc(user!.uid)
          .update({'dados_pessoais.nome': nameController.text});
      Get.snackbar('Sucesso', 'Nome atualizado');
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao atualizar nome');
    }
  }

  Future<void> updateEmailInFirestore() async {
    User ? user = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseFirestore.instance
          .collection('motoristas')
          .doc(user!.uid)
          .update({'dados_pessoais.email': emailController.text});
      await user.updateEmail(emailController.text);
      Get.snackbar('Sucesso', 'Email atualizado');
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao atualizar email');
    }
  }

  Future<void> updateAddressInFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('motoristas')
          .doc(user!.uid)
          .update({'dados_pessoais.endereco': addressController.text});
      Get.snackbar('Sucesso', 'Endereço atualizado');
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao atualizar endereço');
    }
  }

  Future<void> updateCarInfoInFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('motoristas')
          .doc(user!.uid)
          .update({
        'dados_carro.CRLV': crlvController.text,
        'dados_carro.placa': placaController.text,
        'dados_carro.marca': marcaController.text,
        'dados_carro.modelo': modeloController.text
      });
      Get.snackbar('Sucesso', 'Dados atualizados');
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao atualizar dados');
    }
  }

  Future<void> updateBankInfoInFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('motoristas')
          .doc(user!.uid)
          .update({
        'dados_banco.banco': selectedBank.value,
        'dados_banco.agencia': agController.text,
        'dados_banco.conta': contaController.text
      });
      Get.snackbar('Sucesso', 'Dados atualizados');
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao atualizar dados');
    }
  }

  Future<void> updatePasswordInFirebase() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
          email: user!.email!, password: oldPasswordController.text);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPasswordController.text);
      Get.snackbar('Sucesso', 'Senha atualizada');
      await Future.delayed(const Duration(seconds: 2));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Get.snackbar('Erro', 'Senha atual incorreta');
      } else {
        Get.snackbar('Erro', 'Erro ao atualizar senha');
      }
    }
  }
}
