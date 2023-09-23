
import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/images.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Verificar formatos de agencia e conta
/* - bancos diferentes possuem diferentes formatos
 */
//TODO: Mudar estilo de stepper
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Center(
                child: Image(
                    image: const AssetImage(tLogoImage),
                    height: size.height * 0.12),
              ),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: Theme(
                  data: ThemeData.dark().copyWith(
                    canvasColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Stepper(
                    type: StepperType.horizontal,
                    elevation: 0,
                    currentStep: _controller.getCurrentStep(),
                    steps: _controller.getSteps(),
                    onStepContinue: () {
                      setState(() {
                        _controller.next();
                      });
                    },
                    onStepTapped: (step) {
                      if (step <= _controller.getCurrentStep()) {
                        setState(() {
                          _controller.setCurrentStep(step);
                        });
                      }
                    },
                    controlsBuilder: (context, stepper) {
                      return RectTextButton(
                        label: _controller.getCurrentStep() ==
                                _controller.getSteps().length - 1
                            ? tFinishSignUp
                            : tNext,
                        onPressed: () {
                          _controller.processForm(context, stepper);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
