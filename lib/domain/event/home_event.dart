import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetAllTeacherEvent extends HomeEvent {}

final class GetAllInstitutionEvent extends HomeEvent {}

final class GetAllDataEvent extends HomeEvent {
  const GetAllDataEvent();

  @override
  List<Object> get props => [];
}
