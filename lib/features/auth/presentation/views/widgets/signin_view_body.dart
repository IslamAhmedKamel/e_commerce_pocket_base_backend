import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/custom_continue_with_google_widget.dart';

import 'custom_form_signin.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orangeLigth),
        borderRadius: BorderRadius.circular(48.r),
      ),

      child: Column(
        children: [
          CustomFormSignin(),
          CustomContinueWithGoogleWidget(
            color: AppColors.brownLightRGB,
          ),
        ],
      ),
    );
  }
}
