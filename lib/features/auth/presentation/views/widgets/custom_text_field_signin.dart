import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';

class CustomTextFieldSignIn extends StatelessWidget {
  const CustomTextFieldSignIn({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.controller,
    this.obscureText = false,
    required this.title,
  });
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.style16,
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? Gap(0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200.r),
          borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200.r),
          borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200.r),
          borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
        ),
      ),
    );
  }
}
