import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpPageOne extends StatelessWidget {
  const SignUpPageOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  decoration: const InputDecoration(
                    label: Text(tEmail),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return tInvalidEmail;
                    }
                    return null;
                  }),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(tConfirmPassword),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(tBorderRadius)),
                    ),
                    prefixIcon: Icon(Icons.lock_outlined)),
              ),
              const SizedBox(height: tFormHeight - 10),
            ],
          ),
        ),
      ),
    );
  }
}
