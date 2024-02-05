import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_game_tiger/model/bomb_game.dart';
import 'package:the_game_tiger/model/level_item.dart';
import 'package:the_game_tiger/model/user_item.dart';
import 'package:the_game_tiger/pages/difficulty_page.dart';
import 'package:the_game_tiger/pages/level_page.dart';
import 'package:the_game_tiger/pages/settings_page.dart';

enum EDifficult { simple, medium, hard }

LevelItem level1 = LevelItem(
  levelNumber: 1,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);
LevelItem level2 = LevelItem(
  levelNumber: 2,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);
LevelItem level3 = LevelItem(
  levelNumber: 3,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);
LevelItem level4 = LevelItem(
  levelNumber: 4,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);
LevelItem level5 = LevelItem(
  levelNumber: 5,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);
LevelItem level6 = LevelItem(
  levelNumber: 6,
  isSimpleCompleted: false,
  isHardCompleted: false,
  isMediumCompleted: false,
);

UserItem user = UserItem(money: 0, hp: 10);
BombGame bombGame = BombGame();

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key, required this.currentDifficulty});
  final EDifficult currentDifficulty;

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  void initState() {
    super.initState();
    getBombGameSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const DifficultyPage()),
                            );
                          },
                          child: Image.asset('assets/home.png')),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      SettingsPage(
                                        currentDifficulty:
                                            widget.currentDifficulty,
                                      )),
                            );
                          },
                          child: Image.asset('assets/settings.png')),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset('assets/hp.png'),
                          Text(
                            textAlign: TextAlign.center,
                            '${user.hp}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset('assets/money.png'),
                          Positioned(
                            right: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              '${user.money}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 1;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level1.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level1.isSimpleCompleted!) ||
                                        (level1.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level1.isMediumCompleted!) ||
                                        (level1.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level1.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 2;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level2.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level2.isSimpleCompleted!) ||
                                        (level2.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level2.isMediumCompleted!) ||
                                        (level2.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level2.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 3;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level3.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level3.isSimpleCompleted!) ||
                                        (level3.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level3.isMediumCompleted!) ||
                                        (level3.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level3.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 4;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level4.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level4.isSimpleCompleted!) ||
                                        (level4.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level4.isMediumCompleted!) ||
                                        (level4.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level4.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 5;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level5.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level5.isSimpleCompleted!) ||
                                        (level5.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level5.isMediumCompleted!) ||
                                        (level5.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level5.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (user.hp! > 0) {
                                bombGame.currentLevel = 6;
                                bombGame.initCardsList();
                                bombGame.initGame();
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LevelPage(
                                            currentDifficulty:
                                                widget.currentDifficulty,
                                          )),
                                );
                              } else {
                                hpDialog(context);
                              }
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                (level6.isSimpleCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.simple &&
                                            level6.isSimpleCompleted!) ||
                                        (level6.isMediumCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.medium &&
                                            level6.isMediumCompleted!) ||
                                        (level6.isHardCompleted != null &&
                                            widget.currentDifficulty ==
                                                EDifficult.hard &&
                                            level6.isHardCompleted!)
                                    ? Image.asset('assets/completed_level.png')
                                    : Image.asset('assets/unpassed_level.png'),
                                const Positioned(
                                  bottom: 20,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text(
                                          'Closed levels',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        content: Text(
                                          'Complete the initial ones to unlock.',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        actions: [
                                          Card(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                    child: const Text(
                                                      'Ok',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Image.asset('assets/closed_level.png')),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text(
                                          'Closed levels',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        content: Text(
                                          'Complete the initial ones to unlock.',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        actions: [
                                          Card(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                    child: const Text(
                                                      'Ok',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Image.asset('assets/closed_level.png')),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void hpDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Not enough HP.',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.6),
              fontSize: 17,
            ),
          ),
          content: Text(
            'Please, wait an hour.',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.6),
              fontSize: 17,
            ),
          ),
          actions: [
            Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      child: const Text(
                        'Ok',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}

void getBombGameSP(Function() callback) async {
  final prefs = await SharedPreferences.getInstance();
  final rawJson1 = prefs.getString('level1') ?? '';
  final rawJson2 = prefs.getString('level2') ?? '';
  final rawJson3 = prefs.getString('level3') ?? '';
  final rawJson4 = prefs.getString('level4') ?? '';
  final rawJson5 = prefs.getString('level5') ?? '';
  final rawJson6 = prefs.getString('level6') ?? '';
  final rawJson7 = prefs.getString('user') ?? '';
  Map<String, dynamic> map1 = {};
  Map<String, dynamic> map2 = {};
  Map<String, dynamic> map3 = {};
  Map<String, dynamic> map4 = {};
  Map<String, dynamic> map5 = {};
  Map<String, dynamic> map6 = {};
  Map<String, dynamic> map7 = {};
  if (rawJson1.isNotEmpty) {
    map1 = jsonDecode(rawJson1);
  }
  if (rawJson2.isNotEmpty) {
    map2 = jsonDecode(rawJson2);
  }
  if (rawJson3.isNotEmpty) {
    map3 = jsonDecode(rawJson3);
  }
  if (rawJson4.isNotEmpty) {
    map4 = jsonDecode(rawJson4);
  }

  if (rawJson5.isNotEmpty) {
    map5 = jsonDecode(rawJson5);
  }

  if (rawJson6.isNotEmpty) {
    map6 = jsonDecode(rawJson6);
  }

  if (rawJson7.isNotEmpty) {
    map7 = jsonDecode(rawJson7);
  }
  if (map1.isNotEmpty) {
    level1 = LevelItem.fromJson(map1);
  }
  if (map2.isNotEmpty) {
    level2 = LevelItem.fromJson(map2);
  }
  if (map3.isNotEmpty) {
    level3 = LevelItem.fromJson(map3);
  }
  if (map4.isNotEmpty) {
    level4 = LevelItem.fromJson(map4);
  }

  if (map5.isNotEmpty) {
    level5 = LevelItem.fromJson(map5);
  }

  if (map6.isNotEmpty) {
    level6 = LevelItem.fromJson(map6);
  }

  if (map7.isNotEmpty) {
    user = UserItem.fromJson(map7);
  }
  callback();
}
