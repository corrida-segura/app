import 'package:corridasegura/common/profile_image.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageFour extends StatefulWidget {
  const SignUpPageFour({Key? key}) : super(key: key);

  @override
  State<SignUpPageFour> createState() => _SignUpPageFourState();
}

class _SignUpPageFourState extends State<SignUpPageFour> {
  final SignUpController _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(tAdress),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.house_outlined),
                ),
              ),
              const SizedBox(height: 20),
               Center(child: Text(tImageRequest, style: Theme.of(context).textTheme.bodyLarge),),
              const SizedBox(height: 20),
              const Center(child: ProfileImage()),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _controller.isChecked,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          _controller.isChecked = value!;
                        },
                      );
                    },
                  ),
                  Text(
                    tAcceptConditions1,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    tAcceptConditions2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
