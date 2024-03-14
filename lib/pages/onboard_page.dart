import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_onboard_splash/constants/colors/color_constants.dart';
import 'package:task_onboard_splash/constants/onboard_buttons/custom_buttons.dart';
import 'package:task_onboard_splash/constants/texts/text_and_style/onboard_description_and_style.dart';
import 'package:task_onboard_splash/constants/texts/text_and_style/onboard_title_and_style.dart';
import 'package:task_onboard_splash/onboard_model/onboard_model.dart';
import 'package:task_onboard_splash/pages/order_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late PageController pageController;
  int currentPage = 0;
  List<OnboardModel> onboards = OnboardModel.getOnboardModelItems;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboards.length,
                itemBuilder: (context, index) {
                  final items = onboards[index];
                  return Column(
                    children: [
                      FadeIn(
                        child: Image.asset(
                          items.imageName,
                        ),
                      ),
                      Center(
                        child: Expanded(
                          child: OnboardTitleAndStyle(
                            title: items.title,
                          ),
                        ),
                      ),
                      Expanded(
                        child: OnboardDescriptionAndStyle(
                          description: items.description,
                        ),
                      ),
                    ],
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: onboards.length,
              effect: WormEffect(
                activeDotColor: ColorConstants().button,
                dotColor: ColorConstants().slider,
                dotWidth: 50,
              ),
            ),
            const SizedBox(height: 20),
            CustomButtons(
              onLeftButtonPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('Order', true).then((value) {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),);
                });

                    if (currentPage > 0)
                {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {});
                }
              },
              onRightButtonPressed: () {
                if (currentPage < onboards.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {});
                }
                else if (currentPage == onboards.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
              },
              isLastPage: currentPage == onboards.length - 1,
            )
          ],
        ),
      ),
    );
  }
}
