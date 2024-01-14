import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.onPressed,
      this.title,
      this.child,
      this.padding,
      this.border,
      this.color,
      this.size});

  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? border;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: size ??
              Size(
                MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.height * 0.08,
              ),
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 17,
              ),
          backgroundColor: color ?? AppColors.primaryColor,
          shape: border ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
        ),
        onPressed: onPressed,
        child: title != null
            ? Center(
                child: Text(
                  title!,
                  style: AppTextStyle.titleTextStyle.copyWith(
                    color: AppColors.primaryWhiteColor,
                  ),
                ),
              )
            : child);
  }
}
