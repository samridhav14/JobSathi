import 'package:flutter/material.dart';
import 'package:job_sathi/controllers/onboarding_provider.dart';
import 'package:job_sathi/views/common/exports.dart';
import 'package:job_sathi/views/ui/onboarding/widgets/page_one.dart';
import 'package:job_sathi/views/ui/onboarding/widgets/page_three.dart';
import 'package:job_sathi/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardNotifier>(
      builder: (context, onBoardNotifier, child) {
        return Stack(
          children: [
            PageView(
              physics: onBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              onPageChanged: (page) {
                if (page == 2) {
                  onBoardNotifier.isLastPage = true;
                }
              },
              controller: _pageController,
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),
            Positioned(
              bottom: hieght * 0.12,
              right: 0,
              left: 0,
              child: Center(
                child: onBoardNotifier.isLastPage == true
                    ? const SizedBox.shrink()
                    : SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                          activeDotColor: Color(kLight.value),
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 10,
                        ),
                      ),
              ),
            ),
            Positioned(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: onBoardNotifier.isLastPage
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: hieght * 0.1, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _pageController.jumpToPage(2);
                                },
                                child: ReusableText(
                                    text: "Skip",
                                    style: appstyle(16, Color(kLight.value),
                                        FontWeight.w500)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: ReusableText(
                                    text: "Next",
                                    style: appstyle(16, Color(kLight.value),
                                        FontWeight.w500)),
                              ),
                            ],
                          ),
                        )),
            )
          ],
        );
      },
    ));
  }
}
