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

  @override
  Future<void> submitQuiz(List<Map<String, dynamic>> body, int courseId) async {
    final user = Supabase.instance.client.auth.currentUser;

    final getQuiz = await Supabase.instance.client
        .from("user")
        .select("quiz")
        .eq("uid", user!.id)
        .select("quiz");

    getQuiz[0]["quiz"]
        ?.removeWhere((element) => element["course_id"] == courseId);

    final existingQuiz = getQuiz[0]["quiz"];

    final mergeQuiz = [...?existingQuiz, ...body];

    await Supabase.instance.client.from("user").update({
      "quiz": mergeQuiz,
    }).eq("uid", user.id);
  }
}
