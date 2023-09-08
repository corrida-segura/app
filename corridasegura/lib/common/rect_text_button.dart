import 'package:flutter/material.dart';

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
      child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(label.toUpperCase())),
    );
  }
}
