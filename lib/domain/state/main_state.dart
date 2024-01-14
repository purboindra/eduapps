import 'package:equatable/equatable.dart';

sealed class MainState extends Equatable {
  const MainState(this.bottomNavbarIndex);

  final int? bottomNavbarIndex;

  @override
  List<Object> get props => [bottomNavbarIndex ?? 0];
}

class BottomNavbarState extends MainState {
  const BottomNavbarState(super.bottomNavbarIndex);
}
