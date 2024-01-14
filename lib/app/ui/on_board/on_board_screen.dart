import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/svg/onboard_image.svg",
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              20.h,
              const Text(
                "Let's find the \"A\" with us",
                style: AppTextStyle.titleTextStyle,
              ),
              16.h,
              Text(
                "Please Sign in to view personalized recommendations",
                style: AppTextStyle.subTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryBlackColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButtonWidget(
                title: "Choose Course",
                onPressed: () =>
                    context.pushReplacement(AppRouteName.introScreen),
              ),
              30.h,
            ],
          ),
        ),
      ),
    );
  }
}
