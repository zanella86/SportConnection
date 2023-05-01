import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({Key? key, required this.message,  required this.child }) : super(key: key);

  final String message;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
