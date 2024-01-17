import 'package:education_app/data/entities/quiz_entity.dart';
import 'package:education_app/domain/repositories/quiz_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuizRepositoryImplement implements QuizRepository {
  @override
  Future<List<QuizEntity>> getAllQuiz(int courseId) async {
    List<QuizEntity> tempQuiz = [];
    final response = await Supabase.instance.client
        .from("quiz")
        .select("*")
        .eq("course_id", courseId);
    for (final quiz in response) {
      tempQuiz.add(QuizEntity.fromJson(quiz));
    }
    return tempQuiz;
  }
}
