import 'package:flutter/material.dart';
import 'package:the_game_tiger/pages/difficulty_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background.png'))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45, right: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset('assets/tiger.png'),
                      count == 0
                          ? Positioned(
                              top: 150,
                              right: -10,
                              child: Image.asset('assets/text1.png'))
                          : count == 1
                              ? Positioned(
                                  top: 150,
                                  right: -10,
                                  child: Image.asset('assets/text2.png'))
                              : count == 2
                                  ? Positioned(
                                      top: 150,
                                      right: -10,
                                      child: Image.asset('assets/text3.png'))
                                  : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (count < 2) {
                count++;
                setState(() {});
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const DifficultyPage()),
                );
              }
            },
            child: Image.asset('assets/continue.png'),
          )
        ],
      ),
    );
  }
}
