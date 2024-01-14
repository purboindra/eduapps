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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  bool _isObsecure = true;

  @override
  void dispose() {
    _isObsecure = true;
    _nameC.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  void changeObsecure() {
    setState(() {
      _isObsecure = !_isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
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
                "assets/svg/sign_up_image.svg",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              20.h,
              CustomTextFieldWidget(
                title: "Name",
                textEditingController: _nameC,
                hintText: "Your name",
              ),
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
                onPressed: () {},
                title: "Sign Up",
              ),
              15.h,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.commonTextStyle,
                    children: [
                      const TextSpan(text: "Have an account? "),
                      TextSpan(
                        text: "Sign in",
                        style: AppTextStyle.commonTextStyle.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => context.push(AppRouteName.signInScreen),
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
