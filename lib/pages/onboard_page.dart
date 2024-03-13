import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_onboard_splash/constants/colors/color_constants.dart';
import 'package:task_onboard_splash/onboard_model/onboard_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        child: Text(
                          items.title,
                          style: TextStyle(
                            color: ColorConstants().white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        items.description,
                        style: TextStyle(
                          color: ColorConstants().white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (currentPage > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                  child: const Icon(Icons.keyboard_double_arrow_left_sharp),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentPage < onboards.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentPage++;
                      });
                    }
                  },

                  child: currentPage == onboards.length-1 ? const Icon(Icons.skip_next) : const Icon(Icons.keyboard_double_arrow_right_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
