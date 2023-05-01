import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    this.cancelText = 'Cancel',
    this.confirmText = 'OK',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text(cancelText),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text(confirmText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
