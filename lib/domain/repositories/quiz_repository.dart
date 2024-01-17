import 'package:education_app/data/entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<List<QuizEntity>> getAllQuiz(int courseId);
}
