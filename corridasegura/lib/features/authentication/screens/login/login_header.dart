import 'package:corridasegura/constants/images.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
              image: const AssetImage(tLogoImage),
              height: size.height * 0.2),
        ),
        SizedBox(height: size.height * 0.05),
        Text(tLoginTitle, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
