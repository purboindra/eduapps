import 'package:education_app/app/utils/app_print.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    AppPrint.debugLog("BLOC ON CREATE $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    AppPrint.debugLog(
        "BLOC ON CHANGE CURRENT ${change.currentState} CHANGE ${change.nextState}");
    super.onChange(bloc, change);
  }
}
