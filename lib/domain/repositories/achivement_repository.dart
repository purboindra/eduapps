import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';

abstract class AchivementRepository {
  Future<List<QuizResultEntity>> getAllCourseQuiz();
  Future<CourseEntity> getCourseDetail(int courseId);
}
