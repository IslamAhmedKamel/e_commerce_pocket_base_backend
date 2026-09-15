import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';

class CustomSocialContainer extends StatelessWidget {
  const CustomSocialContainer({super.key, required this.imagePath, this.onTap});
  final String imagePath;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: AppColors.brownLight,
          border: Border.all(color: AppColors.primColor),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(width: 24.w, height: 24.h, imagePath),
        ),
      ),
    );
  }
}
