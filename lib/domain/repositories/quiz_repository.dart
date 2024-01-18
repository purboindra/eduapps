import 'package:education_app/data/entities/quiz_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';

abstract class QuizRepository {
  Future<List<QuizEntity>> getAllQuiz(int courseId);
  Future<void> submitQuiz(List<QuizResultEntity> body, int courseId);
  Future<QuizResultEntity> getQuizResult(int courseId);
}
