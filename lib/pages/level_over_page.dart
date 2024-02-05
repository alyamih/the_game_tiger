import 'package:flutter/material.dart';
import 'package:the_game_tiger/pages/level_page.dart';
import 'package:the_game_tiger/pages/levels_page.dart';
import 'package:the_game_tiger/pages/settings_page.dart';

class LevelOverPage extends StatefulWidget {
  const LevelOverPage({super.key, required this.isGoodOver});
  final bool isGoodOver;

  @override
  State<LevelOverPage> createState() => _LevelOverPageState();
}

class _LevelOverPageState extends State<LevelOverPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.isGoodOver
                    ? 'assets/background.png'
                    : 'assets/boom.png'))),
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
                                      const LevelsPage()),
                            );
                          },
                          child: Image.asset('assets/home.png')),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const SettingsPage()),
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
              Stack(
                alignment: Alignment.center,
                children: [
                  widget.isGoodOver
                      ? Image.asset('assets/good_level_over.png')
                      : Image.asset('assets/bad_level_over.png'),
                  Positioned(
                      top: 5,
                      child: widget.isGoodOver
                          ? Text(
                              'LEVEL ${bombGame.currentLevel} IS OVER',
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900),
                            )
                          : const SizedBox()),
                  Positioned(
                    bottom: -5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const LevelsPage()),
                                );
                              },
                              child: Image.asset('assets/menu.png')),
                          InkWell(
                              onTap: () {
                                if (user.hp! > 0) {
                                  if (bombGame.currentLevel != 5) {
                                    bombGame.currentLevel =
                                        bombGame.currentLevel! + 1;
                                  }
                                  bombGame.initCardsList();
                                  bombGame.initGame();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const LevelPage()),
                                  );
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Image.asset('assets/continue.png')),
                          InkWell(
                              onTap: () {
                                if (user.hp! > 0) {
                                  bombGame.initCardsList();
                                  bombGame.initGame();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const LevelPage()),
                                  );
                                } else {
                                  hpDialog(context);
                                }
                              },
                              child: Image.asset('assets/repeat.png')),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
