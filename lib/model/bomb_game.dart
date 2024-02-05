import 'package:flutter/material.dart';

class BombGame {
  List<String>? gameImg;
  int? currentLevel;

  final String hiddenCardpath = "assets/icons/icon_container.png";
  List<String> cards_list = [];
  List<Map<int, String>> matchCheck = [];
  int? cardCount;

  //methods
  void initGame() {
    gameImg = List.generate(cardCount!, (index) => hiddenCardpath);
  }

  void initCardsList() {
    if (currentLevel == 1) {
      cardCount = 4;
      cards_list = [
        "assets/icons/chest.png",
        "assets/icons/chest.png",
        "assets/icons/bomb.png",
        "assets/icons/chest.png",
      ];
    } else if (currentLevel == 2) {
      cardCount = 6;
      cards_list = [
        "assets/icons/brilliant.png",
        "assets/icons/brilliant.png",
        "assets/icons/brilliant.png",
        "assets/icons/brilliant.png",
        "assets/icons/brilliant.png",
        "assets/icons/bomb.png",
      ];
    } else if (currentLevel == 3) {
      cardCount = 8;
      cards_list = [
        "assets/icons/mail.png",
        "assets/icons/mail.png",
        "assets/icons/bomb.png",
        "assets/icons/mail.png",
        "assets/icons/mail.png",
        "assets/icons/mail.png",
        "assets/icons/mail.png",
        "assets/icons/mail.png",
      ];
    } else if (currentLevel == 4) {
      cardCount = 10;
      cards_list = [
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/bomb.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
        "assets/icons/flag.png",
      ];
    } else if (currentLevel == 5) {
      cardCount = 12;
      cards_list = [
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/bomb.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
        "assets/icons/present.png",
      ];
    } else if (currentLevel == 6) {
      cardCount = 12;
      cards_list = [
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
        "assets/icons/bomb.png",
        "assets/icons/crown.png",
        "assets/icons/crown.png",
      ];
    }
  }
}
