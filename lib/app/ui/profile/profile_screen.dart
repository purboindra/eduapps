import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessSignOutState) {
          context.go(AppRouteName.signInScreen);
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () => context.read<AuthBloc>().add(SignOutEvent()),
              child: const Text("Sign Out"),
            ),
          ),
        );
      },
    );
  }
}
