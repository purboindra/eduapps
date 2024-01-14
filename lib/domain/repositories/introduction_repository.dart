import 'package:education_app/data/entities/course_entity.dart';

abstract class IntroductionRepository {
  Future<List<CourseEntity>> getAllCourse();
}
