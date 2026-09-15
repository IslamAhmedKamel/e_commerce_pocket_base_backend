// import 'package:e_commerce_app/core/functions/app_navigator.dart';
// import 'package:e_commerce_app/core/utils/app_colors.dart';
// import 'package:e_commerce_app/core/utils/app_routing.dart';
// import 'package:e_commerce_app/core/utils/app_styles.dart';
// import 'package:e_commerce_app/core/widgets/custom_btn.dart';
// import 'package:e_commerce_app/features/auth/presentation/view_model/forgot_password/forgot_password_cubit.dart';
// import 'package:e_commerce_app/features/auth/presentation/views/widgets/forgot_password_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gap/flutter_gap.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

// class ForgotPasswordView extends StatelessWidget {
//   const ForgotPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.dm),
//           child: SingleChildScrollView(
//             child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
//               listener: (context, state) {
//                 if (state is ForgotPasswordFailure) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusGeometry.circular(16),
//                       ),
//                       duration: Duration(seconds: 2),
//                       content: Text(state.errMessage),
//                     ),
//                   );
//                 } else if (state is ForgotPasswordSuccess) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusGeometry.circular(16),
//                       ),
//                       duration: Duration(seconds: 3),
//                       content: Text(
//                         "${state.forgotResponseModel.statusMsg} ${state.forgotResponseModel.message}",
//                       ),
//                     ),
//                   );
//                   AppNavigator.pushReplacement(
//                     context: context,
//                     path: AppRouting.onBoardingPath,
//                   );
//                 }
//               },

//               builder: (context, state) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Forgot\npassword?", style: AppStyles.style36()),
//                     Gap(32.h),
//                     ForgotPasswordForm(),
//                     Gap(24.h),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "*",
//                           style: AppStyles.style12().copyWith(
//                             color: AppColors.primColor,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             " We will send you a message to set or reset your new password",
//                             style: AppStyles.style10(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Gap(24.h),
//                     state is ForgotPasswordLoading
//                         ? SizedBox(
//                             height: 54.h,
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: AppColors.primColor,
//                               ),
//                             ),
//                           )
//                         : CustomBtn(
//                             text: "Submit",
//                             onTap: () {
//                               BlocProvider.of<ForgotPasswordCubit>(
//                                 context,
//                               ).forgotPassword();
//                             },
//                           ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
