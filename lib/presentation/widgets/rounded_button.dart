import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.textColor = Colors.lime,
    this.backgroundColor = Colors.indigo,
  });

  final IconData? icon;
  final String text;
  final Function() onPressed;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      elevation: 8,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          leading: icon != null
              ? Icon(
            icon,
            color: Colors.teal,
          )
              : null,
          title: Text(
            text,
            textAlign: icon == null ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
