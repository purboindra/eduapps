import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/ui/introduction/introduction_screen.dart';
import 'package:education_app/app/ui/main/main_screen.dart';
import 'package:education_app/app/ui/on_board/on_board_screen.dart';
import 'package:education_app/app/ui/sign_in/sign_in_screen.dart';
import 'package:education_app/app/ui/sign_up/sign_up_screen.dart';
import 'package:education_app/app/ui/splash/splash_screen.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart' as authBloc;
import 'package:education_app/domain/state/auth_state.dart' as authState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.splashScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteName.splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocBuilder<authBloc.AuthBloc, authState.AuthState>(
            buildWhen: (previous, current) =>
                previous != authState.InitialAuthState(),
            builder: (context, state) {
              return const SplashScreen();
            },
          );
        },
      ),
      GoRoute(
        path: AppRouteName.onBoardScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardScreen();
        },
      ),
      GoRoute(
        path: AppRouteName.signInScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: AppRouteName.signUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: AppRouteName.mainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: AppRouteName.introScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const IntroductionScreen();
        },
      ),
    ],
  );
}
