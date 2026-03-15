import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Quick Delivery",
      "subtitle": "Get snacks, drinks, and essentials delivered fast right to your dorm.",
      "icon": "speed"
    },
    {
      "title": "Campus Convenience",
      "subtitle": "Everything you need from local campus stores at your fingertips.",
      "icon": "store"
    },
    {
      "title": "Multiple Payments",
      "subtitle": "Pay securely with EcoCash, OneMoney, InnBucks, Visa, and more.",
      "icon": "payment"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return _buildPageContent(
                    _onboardingData[index]["title"]!,
                    _onboardingData[index]["subtitle"]!,
                    _onboardingData[index]["icon"]!,
                  );
                },
              ),
            ),
            _buildDotsIndicator(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(
                text: _currentPage == _onboardingData.length - 1 ? "Get Started" : "Next",
                onPressed: () {
                  if (_currentPage == _onboardingData.length - 1) {
                    context.go('/login');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Skip', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(String title, String subtitle, String icon) {
    IconData getIcon(String i) {
      if (i == "speed") return Icons.electric_bike;
      if (i == "store") return Icons.storefront;
      return Icons.payments_outlined;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(getIcon(icon), size: 120, color: AppColors.primary),
          const SizedBox(height: 48),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingData.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: _currentPage == index ? 24.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? AppColors.primary : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
