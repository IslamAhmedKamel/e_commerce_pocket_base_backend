import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pocket_base_app/core/utils/app_router.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';
import 'package:pocket_base_app/core/utils/functions/app_navigator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      // غيّر SignupView إلى الشاشة التي تريد الانتقال إليها.
      AppNavigator.navigatePush(
        context: context,
        path: AppRouter.onboardingPath,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4AD16),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 150.w,
                height: 150.h,
              ),
              const SizedBox(height: 20),
              Text('Fresh Fruits', style: AppStyles.style38),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
