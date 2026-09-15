
import 'package:flutter/material.dart';
import 'package:pocket_base_app/core/utils/app_colors.dart';
import 'package:pocket_base_app/core/utils/app_styles.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.orangeColor,
          ),
        ),
        Text(
          " OR Continue with ",
          style: AppStyles.style16.copyWith(
            color: AppColors.brownLight,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
