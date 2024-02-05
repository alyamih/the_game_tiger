import 'package:flutter/material.dart';
import 'package:the_game_tiger/pages/levels_page.dart';
import 'package:the_game_tiger/pages/show_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                                  const LevelsPage()),
                        );
                      },
                      child: Image.asset('assets/home.png')),
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/settings_table.png'),
                        Positioned(
                          top: 80,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const ReadTermsOrPrivacyScreenView(
                                              link: 'google.com',
                                            )),
                                  );
                                },
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF8E4018),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const ReadTermsOrPrivacyScreenView(
                                              link: 'google.com',
                                            )),
                                  );
                                },
                                child: const Text(
                                  'Terms of use',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF8E4018),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Rate app',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF8E4018),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
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
