import 'package:corridasegura/common/rect_text_button.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Verificar formato da cnh, crlv, agência e conta

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
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
                    ? tFinish
                    : tNext,
                onPressed: () {
                  _controller.processForm(context, stepper);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
