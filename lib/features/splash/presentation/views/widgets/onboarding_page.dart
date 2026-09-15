
// Single Onboarding Page
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';
import 'package:pocket_base_app/features/splash/data/models/onboartding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;
  final bool isDesktop;
  final bool isTablet;
  final double screenHeight;
  final double horizontalPadding;

  const OnboardingPage({
    super.key,
    required this.page,
    required this.isDesktop,
    required this.isTablet,
    required this.screenHeight,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableHeight = constraints.maxHeight;
        final double availableWidth = constraints.maxWidth;

        // حجم الصورة يتغير حسب مساحة الشاشة
        final double imageHeight = isDesktop
            ? (availableHeight * 0.50).clamp(220.0, 420.0)
            : isTablet
            ? (availableHeight * 0.40).clamp(180.0, 330.0)
            : (availableHeight * 0.34).clamp(130.0, 260.0);

        final double imageWidth = isDesktop
            ? (availableWidth * 0.70).clamp(250.0, 600.0)
            : (availableWidth * 0.90).clamp(200.0, 600.0);

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: isDesktop ? 12 : 8,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: SvgPicture.asset(page.image, fit: BoxFit.contain),
                    ),

                    Gap(isDesktop ? 80.h : 80.h),
                    // Title
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: isDesktop
                          ? AppStyles.style24.copyWith(
                              fontSize: 32,
                              height: 1.3,
                            )
                          : AppStyles.style24.copyWith(
                              fontSize: isTablet ? 28 : 24.sp,
                              height: 1.3,
                            ),
                    ),

                    Gap(isDesktop ? 20 : 14),

                    // Description
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: AppStyles.style14.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: isDesktop
                              ? 18
                              : isTablet
                              ? 17
                              : 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
