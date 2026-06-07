import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/app_theme.dart';
import '../../core/constants.dart';

class OnboardingData {
  final String emoji;
  final String title;
  final String subtitle;
  final Color bgColor;
  final Color accentColor;

  const OnboardingData({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.accentColor,
  });
}

const _onboardingPages = [
  OnboardingData(
    emoji: '🛒',
    title: 'Belanja Mudah & Cepat',
    subtitle:
        'Temukan jutaan produk dari ribuan penjual terpercaya di Toserba. Belanja kapanpun dan dimanapun!',
    bgColor: Color(0xFFEFF6FF),
    accentColor: Color(0xFF1D4ED8),
  ),
  OnboardingData(
    emoji: '🚚',
    title: 'Pengiriman Terpercaya',
    subtitle:
        'Produk dikirim dengan cepat dan aman ke seluruh Indonesia. Pantau pesananmu secara real-time!',
    bgColor: Color(0xFFF0FDF4),
    accentColor: Color(0xFF10B981),
  ),
  OnboardingData(
    emoji: '💳',
    title: 'Pembayaran Aman',
    subtitle:
        'Bayar dengan berbagai metode: transfer bank, e-wallet, atau kartu kredit. 100% aman dan terlindungi!',
    bgColor: Color(0xFFFFF7ED),
    accentColor: Color(0xFFF59E0B),
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

Future<void> _completeOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(AppConstants.keyOnboardingDone, true);

  if (!mounted) return;

  Navigator.pushReplacementNamed(context, '/login');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _onboardingPages[_currentPage].bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentPage < _onboardingPages.length - 1)
                    TextButton(
                      onPressed: _completeOnboarding,
                      child: Text(
                        'Lewati',
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _OnboardingPage(
                    data: _onboardingPages[index],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingPages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor:
                          _onboardingPages[_currentPage].accentColor,
                      dotColor: AppColors.border,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage <
                            _onboardingPages.length - 1) {
                          _pageController.nextPage(
                            duration:
                                const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _completeOnboarding();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _onboardingPages[_currentPage]
                                .accentColor,
                      ),
                      child: Text(
                        _currentPage <
                                _onboardingPages.length - 1
                            ? 'Selanjutnya'
                            : 'Mulai Belanja',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const _OnboardingPage({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: data.accentColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                data.emoji,
                style: const TextStyle(
                  fontSize: 90,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xxxl),

          Text(
            data.title,
            style: AppTextStyles.displayMedium.copyWith(
              color: data.accentColor,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.lg),

          Text(
            data.subtitle,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}