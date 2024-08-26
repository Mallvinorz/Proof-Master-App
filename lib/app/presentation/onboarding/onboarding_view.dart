import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/presentation/onboarding/widgets/dot_page_indicator.dart';
import 'package:proofmaster/app/presentation/signin/signin_view.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/custom_outlined_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      image: "assets/images/onboarding_first_ilustration.svg",
      title: "Selamat datang di Proof Master!",
      desc:
          "Pelajari geometri matematika dengan cara yang menyenangkan dan interaktif",
    ),
    OnboardingItem(
      image: "assets/images/onboarding_second_ilustration.svg",
      title: "Kuasai konsep geometri",
      desc:
          "Latihan soal dan penjelasan detail membantu Anda memahami setiap topik dengan sempurna",
    ),
    OnboardingItem(
      image: "assets/images/onboarding_third_ilustration.svg",
      title: "Pantau kemajuan belajar Anda",
      desc:
          "Lihat perkembangan dan capaian Anda dalam perjalanan menjadi ahli gemoteri",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorTheme.colorBackground,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingItems.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildOnboardingContent(_onboardingItems[index]);
              },
            ),
          ),
          DotPageIndicator(
            currentValue: _currentPage,
            onboardingItems: _onboardingItems.length,
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildOnboardingContent(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            item.image,
            width: 240,
            height: 240,
          ),
          const SizedBox(height: 24.0),
          Text(
            item.title,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          Text(
            item.desc,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutlinedButton(
              onTap: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  // Go to Sign in Page
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninView(),
                      ));
                }
              },
              text: _currentPage > 0 ? "Kembali" : "Lewati"),
          Button(
              onTap: () {
                if (_currentPage != 2) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  // Go to Sign In Page
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninView(),
                      ));
                }
              },
              text: _currentPage == 2 ? "Masuk" : "Selanjutnya")
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String desc;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.desc,
  });
}
