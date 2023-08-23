import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          const Icon(
            Icons.error,
            size: 40,
            color: Colors.redAccent,
          ),
          Text(message)
        ]),
      ),
    );
  }
}
