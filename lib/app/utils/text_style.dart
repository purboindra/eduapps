import 'package:education_app/app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  const AppTextStyle._();

  static const titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlackColor,
    height: 1.4,
  );

  static const subTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryBlackColor,
    height: 1.4,
  );

  static const commonTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlackColor,
    height: 1.4,
  );
}
