import 'package:education_app/data/entities/course_entity.dart';
import 'package:equatable/equatable.dart';

sealed class IntroductionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetAllCourseEvent extends IntroductionEvent {}

class ChooseProgrammingLanguageEvent extends IntroductionEvent {
  final List<CourseEntity> course;

  ChooseProgrammingLanguageEvent(this.course);

  @override
  List<Object> get props => [course];
}

class RemoveProgrammingLanguageEvent extends IntroductionEvent {
  final List<CourseEntity> course;

  RemoveProgrammingLanguageEvent(this.course);

  @override
  List<Object> get props => [course];
}
