import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
    required this.title,
    required this.wayRegisterText,
    this.onTap,
  });
  final String title, wayRegisterText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppStyles.style16),
            GestureDetector(
              onTap: onTap,
              child: Text(
                wayRegisterText,
                style: AppStyles.style16.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orangeColor,
                  color: AppColors.orangeColor,
                ),
              ),
            ),
          ],
        ),

        Gap(80.h),
      ],
    );
  }
}
