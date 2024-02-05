import 'package:flutter/material.dart';
import 'package:the_game_tiger/pages/levels_page.dart';
import 'package:the_game_tiger/pages/settings_page.dart';

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({super.key});

  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  int currentPage = 0;
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
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const SettingsPage(
                                    currentDifficulty: EDifficult.simple,
                                  )),
                        );
                      },
                      child: Image.asset('assets/settings.png')),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        currentPage == 0
                            ? Image.asset('assets/simple.png')
                            : currentPage == 1
                                ? Image.asset('assets/middle.png')
                                : Image.asset('assets/advanced.png'),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (currentPage > 0) {
                                      currentPage--;
                                    } else {
                                      currentPage = 2;
                                    }
                                    setState(() {});
                                  },
                                  child: Image.asset('assets/back.png')),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              LevelsPage(
                                                currentDifficulty:
                                                    currentPage == 0
                                                        ? EDifficult.simple
                                                        : currentPage == 1
                                                            ? EDifficult.medium
                                                            : EDifficult.hard,
                                              )),
                                    );
                                  },
                                  child: Image.asset('assets/continue.png')),
                              InkWell(
                                  onTap: () {
                                    if (currentPage < 2) {
                                      currentPage++;
                                    } else {
                                      currentPage = 0;
                                    }
                                    setState(() {});
                                  },
                                  child: Image.asset('assets/next.png')),
                            ],
                          ),
                        )
                      ],
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
