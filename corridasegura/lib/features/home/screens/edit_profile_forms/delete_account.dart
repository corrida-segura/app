import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Por motivos de teste, é feito apenas um logout!!!!!

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize + 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeftArrowButton(text: 'Voltar', onTap: () => Get.back()),
                const SizedBox(height: 30),
                Text('Tem certeza que deseja excluir sua conta?',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    
                    onPressed: () async {
                      AuthController.instance.signOut();
                    },
                    child: const Text('Confirmar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
