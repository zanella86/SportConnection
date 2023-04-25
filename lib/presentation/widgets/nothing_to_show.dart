import 'package:flutter/material.dart';

class NothingToShow extends StatelessWidget {
  const NothingToShow({Key? key, required this.message}) : super(key: key);

  final String message;


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
          Icon(
            Icons.mood_bad,
            size: 25,
          ),
        ],
      ),
    );
  }
}
