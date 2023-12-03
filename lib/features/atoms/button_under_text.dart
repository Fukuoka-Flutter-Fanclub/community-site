import 'package:flutter/material.dart';

class ButtonUnderText extends StatelessWidget {
  const ButtonUnderText(
    this.text, {
    super.key,
    this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
