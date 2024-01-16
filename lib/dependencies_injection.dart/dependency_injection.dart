import 'package:education_app/data/repositories/auth_repository_impl.dart';
import 'package:education_app/data/repositories/home_repository_impl.dart';
import 'package:education_app/data/repositories/introduction_repository_impl.dart';
import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:education_app/domain/repositories/home_repository.dart';
import 'package:education_app/domain/repositories/introduction_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInject {
  static Future<void> setup() async {
    getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
    getIt.registerSingleton<IntroductionRepository>(
        IntroductionRepositoryImpl());
    getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl());
  }
}
