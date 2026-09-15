import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_assets.dart';
import 'package:pocket_base_app/core/utils/app_router.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';
import 'package:pocket_base_app/core/utils/functions/app_navigator.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(64.h),
                  CircleAvatar(
                    radius: 46.r,
                    backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      radius: 45.r,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(AppAssets.shmaaaLogo),
                    ),
                  ),
                  Gap(24.h),
                  Text("Skatee", style: AppStyles.style36),
                  Gap(8.h),
                  Text("Welcome to Skatee Fashion", style: AppStyles.style18),
                  Gap(40.h),
                  SigninViewBody(),
                  HaveAnAccount(
                    onTap: () {
                      AppNavigator.navigatePushReplacement(
                        context: context,
                        path: AppRouter.signUpPath,
                      );
                    },
                    title: "Don't have an account? ",
                    wayRegisterText: "Sign Up",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
