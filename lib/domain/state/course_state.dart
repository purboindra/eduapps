import 'package:education_app/data/entities/course_entity.dart';
import 'package:equatable/equatable.dart';

sealed class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

final class InitialCourseState extends CourseState {
  const InitialCourseState();
}

final class LoadingGetAllCourseState extends CourseState {
  const LoadingGetAllCourseState();
}

final class SuccessGetAllCourseState extends CourseState {
  final List<CourseEntity> courses;

  const SuccessGetAllCourseState(
    this.courses,
  );

  @override
  List<Object> get props => [courses];
}
