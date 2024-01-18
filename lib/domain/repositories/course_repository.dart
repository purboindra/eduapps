import 'package:education_app/data/entities/course_entity.dart';

abstract class CourseRepository {
  Future<CourseEntity> getDetailCourse(int courseId);
}
