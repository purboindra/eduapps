import 'package:education_app/data/entities/course_entity.dart';
import 'package:equatable/equatable.dart';

class ChooseProgrammingState extends Equatable {
  final List<CourseEntity> allCourses;

  const ChooseProgrammingState(this.allCourses);

  @override
  List<Object> get props => [allCourses];
}
