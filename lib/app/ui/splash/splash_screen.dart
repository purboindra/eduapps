import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _runTimer();
    super.initState();
  }

  void _runTimer() async {
    await Future.delayed(const Duration(seconds: 2));
    await Future.delayed(Duration.zero, () {
      context.go(AppRouteName.onBoardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/splash_image.svg",
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            20.h,
            Text(
              "AcademiApp",
              style: AppTextStyle.titleTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
