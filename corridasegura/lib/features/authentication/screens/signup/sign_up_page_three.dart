import 'package:corridasegura/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpPageThree extends StatelessWidget {
  const SignUpPageThree({
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
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(
                    value: 'Bank A',
                    child: Text('Bank A'),
                  ),
                  DropdownMenuItem(
                    value: 'Bank B',
                    child: Text('Bank B'),
                  ),
                  DropdownMenuItem(
                    value: 'Bank C',
                    child: Text('Bank C'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Instituição Financeira',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.account_balance),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Agência',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Conta',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              const SizedBox(height: tFormHeight - 10),
            ],
          ),
        ),
      ),
    );
  }
}