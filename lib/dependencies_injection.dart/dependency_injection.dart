import 'package:education_app/data/repositories/auth_repository_impl.dart';
import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInject {
  static Future<void> setup() async {
    getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  }
}