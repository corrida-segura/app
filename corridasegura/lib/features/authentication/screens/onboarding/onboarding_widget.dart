import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/features/authentication/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  

  final OnBoardingModel model;

  const OnBoardingPageWidget({super.key, required this.model});


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                model.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                model.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}