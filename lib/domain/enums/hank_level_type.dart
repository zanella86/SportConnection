import 'package:flutter/material.dart';

enum HankLevelType {

  gold(
      90,
      color: Color.fromRGBO(255, 226, 140, 1),
      shield: "assets/images/cards_bg_golden.png",
      status: "Golden Level"
  ),

  silver(
      70,
      color: Color.fromRGBO(242, 242, 243, 1),
      shield: "assets/images/cards_bg_silver.png",
      status: "Silver Level"
  ),

  bronze(
      20,
      color: Color.fromRGBO(235, 186, 143, 1),
      shield: "assets/images/cards_bg_brown.png",
      status: "Brown Level"
  );

   const HankLevelType(
      this.score, {
      required this.color,
      required this.shield,
      required this.status,
    });

  final int score;
  final Color color;
  final String shield;
  final String status;

}

class HankLevelUtils {
  static HankLevelType getHank(int score) {
    if(score < HankLevelType.bronze.score) {
      return HankLevelType.bronze;
    } else if(score < HankLevelType.silver.score) {
      return HankLevelType.silver;
    }
    return HankLevelType.gold;
  }

}