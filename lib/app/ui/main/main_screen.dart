import 'package:education_app/app/ui/home/home_screen.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<BottomNavigationBarItem> _bottomNavbarItems = [
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 32,
      ),
      label: "Home"),
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/svg/learn_image.svg",
        height: 28,
      ),
      label: "Learn"),
  BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/svg/achievement_image.svg",
        height: 28,
        theme: const SvgTheme(
          currentColor: AppColors.primaryBlackColor,
        ),
      ),
      label: "Achievement"),
  const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.person,
        size: 32,
      ),
      label: "Profile"),
];

final List<Widget> _body = [
  const HomeScreen(),
  const Center(
    child: Text("Learn"),
  ),
  const Center(
    child: Text("Achievement"),
  ),
  const Center(
    child: Text("Profile"),
  ),
];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryWhiteColor,
        selectedFontSize: 12,
        onTap: (value) {},
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryBlackColor,
        items: _bottomNavbarItems,
      ),
      body: _body[0],
    );
  }
}
