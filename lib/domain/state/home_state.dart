import 'package:education_app/data/entities/institution_entity.dart';
import 'package:education_app/data/entities/teacher_entity.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class InitialHomeState extends HomeState {}

final class LoadingGetTeacherState extends HomeState {}

final class FailedGetTeacherState extends HomeState {
  final String errorMessage;

  const FailedGetTeacherState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class SuccessGetTeacherState extends HomeState {
  final List<TeacherEntity> teachers;

  const SuccessGetTeacherState(this.teachers);

  @override
  List<Object> get props => [teachers];
}

final class InitialInstituionState extends HomeState {}

final class LoadingGetAllInstitutionState extends HomeState {
  const LoadingGetAllInstitutionState();
}

final class LoadingGetAllDataState extends HomeState {
  const LoadingGetAllDataState();
}

final class SuccessGetAllInstitution extends HomeState {
  final List<InstitutionEntity> allInstituions;
  const SuccessGetAllInstitution(this.allInstituions);

  @override
  List<Object> get props => [allInstituions];
}

final class SuccessGetAllDataState extends HomeState {
  final List<InstitutionEntity> allInstituions;
  final List<TeacherEntity> teachers;

  const SuccessGetAllDataState(
    this.allInstituions,
    this.teachers,
  );

  @override
  List<Object> get props => [allInstituions, teachers];
}
