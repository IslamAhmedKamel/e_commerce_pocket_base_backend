import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';
import 'package:pocket_base_app/features/splash/data/models/onboartding_model.dart';
import 'package:pocket_base_app/features/splash/presentation/views/widgets/onboarding_page.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Welcome to Fresh Fruits',
      description: 'Discover new features and functionalities.',
      image: 'assets/images/onboarding3.svg',
    ),
    OnboardingModel(
      title: 'We provide best quality Fruits to your family',
      description: 'Get fresh and organic fruits delivered to your doorstep.',
      image: 'assets/images/onboarding2.svg',
    ),
    OnboardingModel(
      title: 'Fast and responsible delivery by our courier',
      description:
          'Get your products delivered to your doorstep quickly and safely.',
      image: 'assets/images/onboarding3.svg',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  void finishOnboarding() {
    // استبدل الجزء ده بالانتقال إلى Login أو Home
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Welcome to the app!')));
  }

  void skipOnboarding() {
    finishOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;
            final double screenHeight = constraints.maxHeight;

            // تحديد نوع الشاشة
            final bool isDesktop = screenWidth >= 900;
            final bool isTablet = screenWidth >= 600 && screenWidth < 900;
            // عرض المحتوى على الشاشات الكبيرة
            final double contentWidth = isDesktop
                ? 1100.w
                : isTablet
                ? 850.w
                : screenWidth;
            // Padding متجاوب
            final double horizontalPadding = isDesktop
                ? 48.h
                : isTablet
                ? 36.h
                : 16.h;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: Column(
                  children: [
                    // Skip Button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: isDesktop ? 12.h : 8.h,
                        ),
                        child: TextButton(
                          onPressed: skipOnboarding,
                          child: Text(
                            'Skip',
                            style: AppStyles.style16.copyWith(
                              fontSize: isDesktop ? 12.sp : 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Onboarding Pages
                    Expanded(
                      child: PageView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        itemCount: pages.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingPage(
                            page: pages[index],
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                            screenHeight: screenHeight,
                            horizontalPadding: horizontalPadding,
                          );
                        },
                      ),
                    ),

                    // Bottom Section
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        12,
                        horizontalPadding,
                        isDesktop ? 28 : 20,
                      ),
                      child: Column(
                        children: [
                          // Page Indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(pages.length, (index) {
                              final bool isSelected = currentPage == index;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                height: 6.h,
                                width: isSelected ? 28.w : 20.w,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.greenColor
                                      : AppColors.whiteLigth,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              );
                            }),
                          ),

                          Gap(isDesktop ? 40.h : 40.h),
                          if (currentPage != pages.length - 1)
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isDesktop ? 500 : 600,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: isDesktop ? 60 : 56,
                                child: ElevatedButton(
                                  onPressed: nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primColor,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(36.r),
                                    ),
                                  ),
                                  child: Text('NEXT', style: AppStyles.style16),
                                ),
                              ),
                            ),

                          if (currentPage == pages.length - 1)
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isDesktop ? 500 : 600,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: isDesktop ? 60.h : 56.h,
                                child: ElevatedButton(
                                  onPressed: nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.blackColor,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(36.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Create an account'.toUpperCase(),
                                    style: AppStyles.style16.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          Gap(18.h),
                          if (currentPage == pages.length - 1)
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isDesktop ? 500 : 600,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: isDesktop ? 60.h : 56.h,
                                child: ElevatedButton(
                                  onPressed: nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(36.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: AppStyles.style16,
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
          },
        ),
      ),
    );
  }
}
