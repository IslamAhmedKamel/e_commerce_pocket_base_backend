import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/widgets/custom_btn.dart';
import 'package:pocket_base_app/features/auth/presentation/view_model/auth%20cubit/auth-cubit.dart';
import 'package:pocket_base_app/features/auth/presentation/view_model/auth%20cubit/auth_state.dart';
import 'package:pocket_base_app/features/auth/presentation/views/widgets/custom_text_field_signup.dart';

class CustomFormSinup extends StatelessWidget {
  const CustomFormSinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final authCubit = context.read<AuthCubit>();
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return Form(
              key: authCubit.formKey,
              child: Column(
                children: [
                  CustomTextFieldSinUp(
                    controller: authCubit.nameController,
                    title: "Full Name",
                    hintText: "Jane Doe",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      if (value.length > 20) {
                        return 'Username must be less than 20 characters';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                        return 'Username can only contain letters, numbers, and underscores';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextFieldSinUp(
                    controller: authCubit.emailController,
                    title: "Email Address",
                    hintText: "jane@example.com",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_rounded),
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
                  CustomTextFieldSinUp(
                    controller: authCubit.passwordController,
                    title: " Password",
                    hintText: "••••••••",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {},

                      color: AppColors.brownLight,
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
                  const Gap(16),
                  CustomTextFieldSinUp(
                    controller: authCubit.passwordConfirmController,
                    hintText: "••••••••",
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {}, // ✅ دالة منفصلة

                      color: AppColors.brownLight,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }

                      return null;
                    },
                    title: 'Confirm Password',
                  ),
                  Gap(16.h),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : CustomBtn(title: 'Sign Up', onTap: authCubit.register),

                  Gap(50.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
