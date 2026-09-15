import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/widgets/custom_btn.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/custom_text_field_signin.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/forgot_password_widget.dart';

class CustomFormSignin extends StatelessWidget {
  const CustomFormSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            children: [
              CustomTextFieldSignIn(
                title: "Email Address",
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // تحقق من صحة البريد الإلكتروني
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const Gap(16),
              CustomTextFieldSignIn(
                title: "Password",
                // controller: signin.passwordController,
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    // قم بتغيير حالة الرؤية هنا
                  },
                  color: AppColors.blackColor,
                  icon: Icon(Icons.visibility_off),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (value.length > 20) {
                    return 'Password must be less than 20 characters';
                  }
                  // تحقق من وجود حرف كبير
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  // تحقق من وجود حرف صغير
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  // تحقق من وجود رقم
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one number';
                  }
                  // تحقق من وجود رمز خاص
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              Gap(16.h),

              Gap(12.h),
              ForgotPasswordWidget(),
              Gap(32.h),
              CustomBtn(title: 'Login'),
              Gap(50.h),
            ],
          ),
        ],
      ),
    );
  }
}
