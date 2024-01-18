import 'package:education_app/data/entities/quiz_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:education_app/domain/repositories/achivement_repository.dart';
import 'package:education_app/domain/repositories/quiz_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuizRepositoryImplement implements QuizRepository {
  const QuizRepositoryImplement(this.achivementRepository);

  final AchivementRepository achivementRepository;

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
    final courseDetail = await achivementRepository.getCourseDetail(courseId);

    final user = Supabase.instance.client.auth.currentUser;

    int totalScore = 0;

    final correctAnswer = body.where((element) => element.score != 0).toList();

    final wrongAnswer = body.where((element) => element.score == 0).toList();

    for (final score in correctAnswer) {
      totalScore += score.score!;
    }

    final getQuiz = await Supabase.instance.client
        .from("user")
        .select("quiz")
        .eq("uid", user!.id)
        .select("quiz");

    List<dynamic>? quizData = [];

    // CONDITION IF USER FIRST TIME SUBMIT QUIZ
    if (getQuiz[0]["quiz"] != null) {
      quizData = getQuiz[0]["quiz"][0]["data"];
    }

    final currentQuiz = List<Map<String, dynamic>>.from(quizData ?? []);

    if (currentQuiz.isNotEmpty) {
      currentQuiz.removeWhere((element) => element["course_id"] == courseId);
    }

    final dataSubmit = [
      {
        "quiz": body,
        "course_id": courseId,
        "course_title": courseDetail.title,
        "course_image": courseDetail.imageUrl!,
        "total_score": totalScore,
        "correct_answer": correctAnswer.length,
        "wrong_answer": wrongAnswer.length,
        "total_question": body.length,
      }
    ];

    final mergeQuiz = [...currentQuiz, ...dataSubmit];

    await Supabase.instance.client.from("user").update({
      "quiz": [
        {
          "data": mergeQuiz,
        },
      ],
    }).eq("uid", user.id);
  }

  @override
  Future<QuizResultEntity> getQuizResult(int courseId) async {
    final user = Supabase.instance.client.auth.currentUser;

    final fetchQuiz = await Supabase.instance.client
        .from("user")
        .select("quiz")
        .eq("uid", user!.id)
        .select("quiz");

    final getAllQuiz =
        List<Map<String, dynamic>>.from(fetchQuiz[0]["quiz"][0]["data"]);

    final getQuiz = getAllQuiz
        .where((element) => element["course_id"] == courseId)
        .toList();

    final quizResultEntity = QuizResultEntity(
      totalCorrectAnswer: getQuiz[0]["correct_answer"],
      questionId: courseId,
      totalQuestion: getQuiz[0]["quiz"].length,
      totalScore: getQuiz[0]["total_score"],
      totalWrongAnswer: getQuiz[0]["wrong_answer"],
    );

    return quizResultEntity;
  }
}
