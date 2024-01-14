import 'package:education_app/data/entities/course_entity.dart';
import 'package:equatable/equatable.dart';

sealed class IntroductionState extends Equatable {
  @override
  List<Object> get props => [];
}

final class IntroductionInitialState extends IntroductionState {}

final class LoadingGetAllCourseState extends IntroductionState {}

final class SuccessGetAllCourseState extends IntroductionState {
  final List<CourseEntity> allCourses;

  SuccessGetAllCourseState(this.allCourses);

  @override
  List<Object> get props => [allCourses];
}

// final class ProgrammingLanguageListState extends IntroductionState {
//   final List<CourseEntity> allCourses;

//   ProgrammingLanguageListState(this.allCourses);

//   @override
//   List<Object> get props => [allCourses];
// }
