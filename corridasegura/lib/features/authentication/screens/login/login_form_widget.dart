import 'package:corridasegura/common/rect_text_button.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(tBorderRadius)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tWrongEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius))),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tWrongPassword;
                }
                return null;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            const RectTextButton(label: tLogin),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tDontHaveAnAccount,
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(width: 5),
                    Text(tSignup,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.blue)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}


