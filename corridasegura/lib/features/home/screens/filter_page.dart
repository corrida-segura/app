
import 'package:corridasegura/common/my_buttons.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';

import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final FilterController _controller = Get.put(FilterController());
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
                child: Text("Preferências",
                    style: Theme.of(context).textTheme.displaySmall),
              ),
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
                            ? tFinishFilter
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
