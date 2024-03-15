import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_onboard_splash/constants/color_constants.dart';
import 'package:task_onboard_splash/pages/onboard_page/widgets/onboard_left_button.dart';
import 'package:task_onboard_splash/pages/onboard_page/widgets/onboard_skip_button.dart';
import 'package:task_onboard_splash/pages/onboard_page/widgets/onboard_right_button.dart';
import 'package:task_onboard_splash/pages/onboard_page/widgets/onboard_description_and_style.dart';
import 'package:task_onboard_splash/pages/onboard_page/widgets/onboard_title_and_style.dart';
import 'package:task_onboard_splash/onboard_model/onboard_model.dart';
import 'package:task_onboard_splash/pages/order_page/order_screen.dart';

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          items.imageName,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      OnboardTitleAndStyle(
                        title: items.title,
                      ),
                      const SizedBox(height: 20),
                      OnboardDescriptionAndStyle(
                        description: items.description,
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
            const SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LeftButton(
                  onPressed: () {
                    if (currentPage > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {});
                    }
                  },
                ),
                const OnboardSkipButton(),
                RightButton(
                  onPressed: () async {
                    if (currentPage < onboards.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {});
                    } else if (currentPage == onboards.length - 1) {
                      SharedPreferences prefsOrder = await SharedPreferences.getInstance();
                      SharedPreferences prefsSplash = await SharedPreferences.getInstance();
                      await prefsSplash.setBool('Splash', false);
                      await prefsOrder.setBool('Order', true).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const OrderPage()),
                        );
                      });
                    }
                  },
                  isLastPage: currentPage == onboards.length - 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}