import 'package:education_app/app/ui/achivement/achivement_screen.dart';
import 'package:education_app/app/ui/home/home_screen.dart';
import 'package:education_app/app/ui/profile/profile_screen.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart';
import 'package:education_app/domain/bloc/course_bloc.dart';
import 'package:education_app/domain/cubit/main_cubit.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/event/course_event.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:education_app/domain/state/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BottomNavigationBarItem> _bottomNavbarItems = [
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 32,
      ),
      label: "Home"),
  const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.book,
        size: 32,
      ),
      label: "Learn"),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.star_outline,
        size: 32,
      ),
      label: "Achivement"),
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
  AchievementScreen(),
  const ProfileScreen(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(GetCurrentUserEvent());
    run();
    super.initState();
  }

  void run() async {
    await Future.delayed(const Duration(seconds: 1), () {
      final state = context.read<AuthBloc>().state;
      if (state is SuccessGetCurrentUserState) {
        final temp = <String>[];
        Future.delayed(Duration.zero, () {
          for (final courseId in state.user.userMetadata?["courses"]) {
            temp.add(courseId.toString());
          }
          context.read<CourseBloc>().add(CourseEvent(temp));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryWhiteColor,
          currentIndex: state.bottomNavbarIndex!,
          selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
          selectedFontSize: 12,
          onTap: (value) => context.read<MainCubit>().changeTabIndex(value),
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondaryBlackColor,
          items: _bottomNavbarItems,
        ),
        body: _body[state.bottomNavbarIndex!],
      );
    });
  }
}
