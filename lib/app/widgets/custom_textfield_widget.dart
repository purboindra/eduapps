import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.title,
      required this.textEditingController,
      this.border,
      required this.hintText,
      this.hintStyle,
      this.borderRadius,
      this.suffixIcon,
      this.isObsecure,
      this.onPressedObsecure});

  final String title;
  final TextEditingController textEditingController;
  final InputBorder? border;
  final String hintText;
  final TextStyle? hintStyle;
  final BorderRadiusGeometry? borderRadius;
  final bool? isObsecure;
  final VoidCallback? onPressedObsecure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.commonTextStyle.copyWith(
            color: AppColors.secondaryBlackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        title.isNotEmpty ? 11.h : 0.h,
        Material(
          elevation: 7.0,
          shadowColor: AppColors.primaryBlackColor.withOpacity(0.3),
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: TextFormField(
            obscureText: isObsecure ?? false,
            autofocus: false,
            controller: textEditingController,
            decoration: InputDecoration(
              border: border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
              suffixIcon: isObsecure != null
                  ? IconButton(
                      onPressed: onPressedObsecure,
                      icon: Icon(
                        isObsecure ?? false
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )
                  : suffixIcon,
              filled: true,
              fillColor: AppColors.primaryWhiteColor,
              hintText: hintText,
              hintStyle: hintStyle ??
                  AppTextStyle.commonTextStyle.copyWith(
                    color: AppColors.secondaryBlackColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
