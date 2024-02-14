import 'package:flutter/material.dart';
import 'package:nutri_scan/pages/screens/intro_page1.dart';
import 'package:nutri_scan/pages/screens/intro_page2.dart';
import 'package:nutri_scan/pages/screens/intro_page3.dart';
import 'package:nutri_scan/pages/screens/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  //controller to keep track of pages
  PageController controller = PageController();

  //keep track of last page
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      body: Stack(
        children: [
          //page view
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          //page indicator
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //dot indicator
                SmoothPageIndicator(controller: controller, count: 3),

                // next / done
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }),
                          );
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
