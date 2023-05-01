import 'package:flutter/material.dart';

enum RankLevelType {
  gold(
      90,
      color: Color.fromRGBO(255, 226, 140, 1),
      shield: "assets/images/cards_bg_golden.png",
      status: "Gold Level"
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
      status: "Bronze Level"
  );

   const RankLevelType(
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

class RankLevelUtils {
  static RankLevelType getHank(int score) {
    if(score < RankLevelType.bronze.score) {
      return RankLevelType.bronze;
    } else if(score < RankLevelType.silver.score) {
      return RankLevelType.silver;
    }
    return RankLevelType.gold;
  }
}