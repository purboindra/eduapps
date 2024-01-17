import 'package:equatable/equatable.dart';

class CourseEvent extends Equatable {
  const CourseEvent(this.allCourse);

  final List<String> allCourse;

  @override
  List<Object> get props => [allCourse];
}
