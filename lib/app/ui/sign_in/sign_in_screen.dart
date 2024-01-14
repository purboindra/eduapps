import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_button_widget.dart';
import 'package:education_app/app/widgets/custom_textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  bool _isObsecure = true;

  void changeObsecure() {
    setState(() {
      _isObsecure = !_isObsecure;
    });
  }

  @override
  void dispose() {
    _emailC.dispose();
    _passwordC.dispose();
    _isObsecure = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () => context.pushReplacement(AppRouteName.signUpScreen),
        //   icon: const Icon(
        //     Icons.chevron_left,
        //     size: 32,
        //   ),
        // ),
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            children: [
              SvgPicture.asset(
                "assets/svg/sign_in_image.svg",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              20.h,
              15.h,
              CustomTextFieldWidget(
                title: "Email",
                textEditingController: _emailC,
                hintText: "Email Address",
              ),
              15.h,
              CustomTextFieldWidget(
                isObsecure: _isObsecure,
                title: "Password",
                onPressedObsecure: () => changeObsecure(),
                textEditingController: _passwordC,
                hintText: "Your Password",
              ),
              50.h,
              CustomButtonWidget(
                onPressed: () => context.go(AppRouteName.mainScreen),
                title: "Sign In",
              ),
              15.h,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.commonTextStyle,
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign up",
                        style: AppTextStyle.commonTextStyle.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => context.push(AppRouteName.signUpScreen),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
