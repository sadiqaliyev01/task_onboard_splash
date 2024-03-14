import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../constants/onboard_description_and_style.dart';
import '../../../constants/onboard_title_and_style.dart';
import '../../../onboard_model/onboard_model.dart';

class OnboardPageViewBuilder extends StatefulWidget {
   const OnboardPageViewBuilder({super.key});

  @override
  State<OnboardPageViewBuilder> createState() => _OnboardPageViewBuilderState();
}

class _OnboardPageViewBuilderState extends State<OnboardPageViewBuilder> {
  late PageController pageController;

  int currentPage = 0;

  List<OnboardModel> onboards = OnboardModel.getOnboardModelItems;

   @override
  void initState() {
    super.initState();
     pageController = PageController(initialPage: currentPage);
   }

   @override
  void dispose() {
    super.dispose();
     pageController.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
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
            Expanded(
              child: OnboardTitleAndStyle(
                title: items.title,
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
    );
  }
}
