import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  const ErrorText({Key? key, required this.message, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
