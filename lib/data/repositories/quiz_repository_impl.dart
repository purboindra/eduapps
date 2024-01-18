import 'package:education_app/data/entities/quiz_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
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
  Future<void> submitQuiz(List<QuizResultEntity> body, int courseId) async {
    final user = Supabase.instance.client.auth.currentUser;

    int totalScore = 0;

    final correctAnswer = body.where((element) => element.score != 0).toList();

    for (final score in correctAnswer) {
      totalScore += score.score!;
    }

    List<Map<String, dynamic>> currentQuiz = [];

    final getQuiz = await Supabase.instance.client
        .from("user")
        .select("quiz")
        .eq("uid", user!.id)
        .select("quiz");

    final List<dynamic>? quizData = getQuiz[0]["quiz"] ?? [];

    if (quizData!.isNotEmpty) {
      final Map<String, dynamic>? convertQuizToMap = quizData[0];
      final List<dynamic>? quizList = convertQuizToMap?["quiz"] ?? [];
      currentQuiz = List<Map<String, dynamic>>.from(quizList ?? []);
    }

    // CONDITION IF USER FIRST TIME SUBMIT QUIZ
    if (getQuiz[0]["quiz"] != null) {
      currentQuiz =
          List<Map<String, dynamic>>.from(getQuiz[0]["quiz"][0]["quiz"] ?? []);
    }

    final checkExistingQuiz = currentQuiz.indexWhere((element) =>
        element.isNotEmpty &&
        element["course_id"] != null &&
        element["course_id"] == courseId);

    if (checkExistingQuiz == -1) {
      // NOT FOUND
      currentQuiz.add({
        "quiz": body,
        "course_id": courseId,
      });
    } else {
      currentQuiz[checkExistingQuiz] = {
        "course_id": courseId,
        "quiz": body.map((e) => e.toJson()).toList(),
      };
    }

    await Supabase.instance.client.from("user").update({
      "quiz": [
        {
          "course_id": courseId,
          "total_score": totalScore,
          "correct_answer": correctAnswer.length,
          "quiz": currentQuiz,
        },
      ],
    }).eq("uid", user.id);
  }
}
