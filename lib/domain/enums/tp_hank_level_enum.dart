import 'package:flutter/material.dart';

enum TpHankLevelEnum {

  gold(
      100,
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

   const TpHankLevelEnum(
      this.score, {
      required this.color,
      required this.shield,
      required this.status,
    });

  final int score;
  final Color color;
  final String shield;
  final String status;

  /*int getScore() {
    return score;
  }

  Color getColor() {
    return color;
  }

  String getShield() {
    return shield;
  }

  String getStatus() {
    return status;
  }*/

  TpHankLevelEnum getHank(int score) {  //TODO Prova de conceito
    if(score < TpHankLevelEnum.bronze.score) {
      return TpHankLevelEnum.bronze;
    } else if(score < TpHankLevelEnum.silver.score) {
      return TpHankLevelEnum.silver;
    }
    return TpHankLevelEnum.gold;
  }

}