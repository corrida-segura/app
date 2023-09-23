import 'package:corridasegura/constants/sizes.dart';
import 'package:flutter/material.dart';

class LeftArrowButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const LeftArrowButton({
    super.key,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: GestureDetector(
          onTap: onTap, child: Text(text != null ? '< $text' : '<')),
    );
  }
}

class RightArrowButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const RightArrowButton({
    super.key,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: Text((text != null && text!.length <23) ? ' $text >' : '>',
        overflow: TextOverflow.ellipsis,));
  }
}

class RectTextButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const RectTextButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(tBorderRadius),
              ),
            ),
          ),
          child: Text(label.toUpperCase())),
    );
  }
}

class UserDataEditButton extends StatelessWidget {
  final String label;
  final String? data;
  final Function()? onTap;

  const UserDataEditButton({
    super.key,
    required this.label,
    this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), RightArrowButton(text: data, onTap: onTap)],
      ),
    );
  }
}
