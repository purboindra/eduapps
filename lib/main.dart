import 'package:education_app/app/route/router.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app_bloc.dart';
import 'package:education_app/data/repositories/auth_repository_impl.dart';
import 'package:education_app/dependencies_injection.dart/dependency_injection.dart';
import 'package:education_app/dependencies_injection.dart/inject.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart';
import 'package:education_app/domain/bloc/home_bloc.dart';
import 'package:education_app/domain/bloc/introduction_bloc.dart';
import 'package:education_app/domain/cubit/choose_programming_cubit.dart';
import 'package:education_app/domain/cubit/main_cubit.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/event/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await DependencyInject.setup();

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"] ?? "",
    anonKey: dotenv.env["SUPABASE_ANON_KEY"] ?? "",
  );

  Bloc.observer = AppBlocObserver();

  final authRepositoryImpl = AuthRepositoryImpl();

  runApp(MyApp(
    authRepositoryImpl: authRepositoryImpl,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required AuthRepositoryImpl authRepositoryImpl, super.key})
      : _authRepositoryImpl = authRepositoryImpl;

  final AuthRepositoryImpl _authRepositoryImpl;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepositoryImpl,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthBloc(_authRepositoryImpl)
                ..add(CheckuserAlreadyLoggedInEvent())),
          BlocProvider(
            create: (_) => IntroductionBloc(inject()),
          ),
          BlocProvider(
            create: (_) => ChooseProgrammingCubit(),
          ),
          BlocProvider(
            create: (_) => MainCubit(),
          ),
          BlocProvider(
            create: (_) => HomeBloc(inject())..add(GetAllTeacherEvent()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              background: AppColors.backgroundColor,
            ),
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
