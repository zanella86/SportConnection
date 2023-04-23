import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.label,
    required this.onTextChange,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onTextChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onTextChange,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 3, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
