import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/views/onboarding/widgets/dot_page_indicator.dart';
import 'package:proofmaster/app/presentation/providers/initial_route_provider/initial_route_provider.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/custom_outlined_button.dart';

class OnBoardingView extends ConsumerStatefulWidget {
  const OnBoardingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends ConsumerState<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final onBoardRepositoryProvider = ref.watch(onboardingRepositoryProvider);

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
          _buildNavigationButtons(onFinishOnBoaring: () {
            onBoardRepositoryProvider.setOnboardStatus(true);
            context.replace(ProofmasterRoute.auth);
          }),
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

  Widget _buildNavigationButtons({required Function onFinishOnBoaring}) {
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
                  onFinishOnBoaring();
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
                  onFinishOnBoaring();
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
