import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: Text(message),
      ),
    );
  }
}

void showErrorDialog(
  BuildContext context,
  String message,
) {
  showDialog(
    context: context,
    builder: (context) {
      return ErrorDialog(message: message);
    },
  );
}
