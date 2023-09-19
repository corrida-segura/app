import 'package:corridasegura/common/rect_text_button.dart';
import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/controller/auth_controller.dart';
import 'package:corridasegura/features/authentication/screens/signup/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isButtonDisabled = true; 
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    email.addListener(validateFields);
    password.addListener(validateFields);
  }

  void validateFields() {
  
    setState(() {
      isButtonDisabled = email.text.isEmpty || password.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
            
              controller: email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                label: Text(tEmail),
                hintText: tEmailHint,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(tBorderRadius)),
                ),
              ),
              //TODO: Refatorar código das validações (criar método)
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return tInvalidEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: password,
              obscureText: obscurePassword,
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPasswordHint,
                border: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius))),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    obscurePassword = !obscurePassword;
                  }),
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite a senha';
                }
                return null;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            RectTextButton(
              label: tLogin,
              onPressed: (!isButtonDisabled)
                  ? () {
                    return AuthController().signInEmail(
                      email: email.text.trim(), password: password.text.trim());
                  }
                  : null,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
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
