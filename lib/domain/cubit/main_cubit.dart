import 'package:education_app/domain/state/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const BottomNavbarState(0));

  void changeTabIndex(int index) => emit(BottomNavbarState(index));
}
