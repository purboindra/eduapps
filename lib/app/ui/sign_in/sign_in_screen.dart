import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/app_snackbar.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_button_widget.dart';
import 'package:education_app/app/widgets/custom_textfield_widget.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessSignInState) {
            context.pushReplacement(AppRouteName.mainScreen);
          } else if (state is ErrorSignInState) {
            AppSnakcbar.showSnackbar(context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                    onPressed: state is LoadingAuthState
                        ? null
                        : () => context.read<AuthBloc>().add(
                              SignInEvent(_emailC.text, _passwordC.text),
                            ),
                    title: state is LoadingAuthState ? "Loading" : "Sign In",
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
          );
        },
      ),
    );
  }
}
