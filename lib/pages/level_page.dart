import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_game_tiger/model/level_item.dart';
import 'package:the_game_tiger/model/user_item.dart';
import 'package:the_game_tiger/pages/level_over_page.dart';
import 'package:the_game_tiger/pages/levels_page.dart';
import 'package:the_game_tiger/pages/settings_page.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key, required this.currentDifficulty});
  final EDifficult currentDifficulty;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  String bombImage = '';
  int currentIndex = 100;
  List<String> checkedBlocks = [];
  bool gameOver = false;
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) => LevelsPage(
                                        currentDifficulty:
                                            widget.currentDifficulty,
                                      )),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: OtpTimer(callback: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        user.hp = user.hp! - 1;
                        addSP(level1, level2, level3, level4, level5, level6,
                            user);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => LevelOverPage(
                                    isGoodOver: false,
                                    currentDifficulty: widget.currentDifficulty,
                                  )),
                        );
                      });
                    }),
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
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/level_table.png'),
                      Positioned(
                          top: 5,
                          child: Text(
                            'LEVEL ${bombGame.currentLevel}',
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900),
                          )),
                      Positioned(
                        top: bombGame.currentLevel == 1
                            ? 10
                            : bombGame.currentLevel == 2
                                ? 60
                                : bombGame.currentLevel == 5
                                    ? 110
                                    : 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: bombGame.currentLevel == 1 ||
                                        bombGame.currentLevel == 2
                                    ? 300
                                    : bombGame.currentLevel == 5 ||
                                            bombGame.currentLevel == 6
                                        ? 400
                                        : 270,
                                width: bombGame.currentLevel == 4
                                    ? 350
                                    : bombGame.currentLevel == 5 ||
                                            bombGame.currentLevel == 6
                                        ? 400
                                        : 300,
                                child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: bombGame.gameImg!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: bombGame
                                                        .currentLevel ==
                                                    3
                                                ? 4
                                                : bombGame.currentLevel == 4
                                                    ? 5
                                                    : bombGame.currentLevel == 2
                                                        ? 3
                                                        : bombGame.currentLevel ==
                                                                1
                                                            ? 2
                                                            : 6,
                                            mainAxisSpacing: 8.0,
                                            crossAxisSpacing: 8.0),
                                    padding: EdgeInsets.all(
                                        bombGame.currentLevel == 1
                                            ? 50.0
                                            : bombGame.currentLevel == 2
                                                ? 20
                                                : 0),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (!gameOver) {
                                            setState(() {
                                              bombGame.gameImg![index] =
                                                  bombGame.cards_list[index];
                                              currentIndex = index;
                                            });
                                            if (bombGame.gameImg![index] ==
                                                "assets/icons/bomb.png") {
                                              gameOver = true;
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500), () {
                                                user.hp = user.hp! - 1;
                                                addSP(
                                                    level1,
                                                    level2,
                                                    level3,
                                                    level4,
                                                    level5,
                                                    level6,
                                                    user);
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          LevelOverPage(
                                                            isGoodOver: false,
                                                            currentDifficulty:
                                                                widget
                                                                    .currentDifficulty,
                                                          )),
                                                );
                                              });
                                            } else {
                                              checkedBlocks.add(
                                                  bombGame.gameImg![index]);

                                              if (checkedBlocks.length ==
                                                  bombGame.cards_list.length -
                                                      1) {
                                                gameOver = true;
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500), () {
                                                  setState(() {
                                                    if (bombGame.currentLevel ==
                                                        level1.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level1.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level1.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level1.isHardCompleted =
                                                            true;
                                                      }
                                                    } else if (bombGame
                                                            .currentLevel ==
                                                        level2.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level2.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level2.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level2.isHardCompleted =
                                                            true;
                                                      }
                                                    } else if (bombGame
                                                            .currentLevel ==
                                                        level3.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level3.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level3.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level3.isHardCompleted =
                                                            true;
                                                      }
                                                    } else if (bombGame
                                                            .currentLevel ==
                                                        level4.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level4.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level4.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level4.isHardCompleted =
                                                            true;
                                                      }
                                                    } else if (bombGame
                                                            .currentLevel ==
                                                        level5.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level5.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level5.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level5.isHardCompleted =
                                                            true;
                                                      }
                                                    } else if (bombGame
                                                            .currentLevel ==
                                                        level6.levelNumber) {
                                                      if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.simple) {
                                                        level6.isSimpleCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.medium) {
                                                        level6.isMediumCompleted =
                                                            true;
                                                      } else if (widget
                                                              .currentDifficulty ==
                                                          EDifficult.hard) {
                                                        level6.isHardCompleted =
                                                            true;
                                                      }
                                                    }
                                                    user.money =
                                                        user.money! + 50;

                                                    user.hp = user.hp! - 1;
                                                    addSP(
                                                        level1,
                                                        level2,
                                                        level3,
                                                        level4,
                                                        level5,
                                                        level6,
                                                        user);

                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute<void>(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              LevelOverPage(
                                                                isGoodOver:
                                                                    true,
                                                                currentDifficulty:
                                                                    widget
                                                                        .currentDifficulty,
                                                              )),
                                                    );
                                                  });
                                                });
                                              }
                                            }
                                          }
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: bombGame.gameImg![
                                                                index] ==
                                                            "assets/icons/bomb.png"
                                                        ? const AssetImage(
                                                            "assets/bomb_container.png")
                                                        : bombGame.gameImg![
                                                                    index] !=
                                                                "assets/icons/icon_container.png"
                                                            ? const AssetImage(
                                                                "assets/icons/icon_container.png")
                                                            : const AssetImage(
                                                                "assets/icons/icon_container1.png")),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            bombGame.gameImg![index] !=
                                                    "assets/icons/icon_container.png"
                                                ? Image.asset(
                                                    bombGame.gameImg![index],
                                                    scale: 1.5,
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addSP(
      LevelItem? levelMatch1,
      LevelItem? levelMatch2,
      LevelItem? levelMatch3,
      LevelItem? levelMatch4,
      LevelItem? levelMatch5,
      LevelItem? levelMatch6,
      UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();

    String rawJson1 = jsonEncode(levelMatch1!.toJson());
    prefs.setString('level1', rawJson1);

    String rawJson2 = jsonEncode(levelMatch2!.toJson());
    prefs.setString('level2', rawJson2);

    String rawJson3 = jsonEncode(levelMatch3!.toJson());
    prefs.setString('level3', rawJson3);

    String rawJson4 = jsonEncode(levelMatch4!.toJson());
    prefs.setString('level4', rawJson4);

    String rawJson5 = jsonEncode(levelMatch5!.toJson());
    prefs.setString('level5', rawJson5);
    String rawJson6 = jsonEncode(levelMatch6!.toJson());
    prefs.setString('level6', rawJson6);

    String rawJson7 = jsonEncode(user!.toJson());
    prefs.setString('user', rawJson7);
  }
}

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key, required this.callback});
  final Function() callback;

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) {
            timer.cancel();
            widget.callback();
          }
        });
      }
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          timerText,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
