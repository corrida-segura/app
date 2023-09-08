import 'package:corridasegura/constants/images.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: Image(
              image: const AssetImage(tLogoImage), height: size.height * 0.12),
        ),
        SizedBox(height: size.height * 0.05),
      ],
    );
  }
}
