import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:education_app/domain/repositories/achivement_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AchivementRepositoryImpl implements AchivementRepository {
  @override
  Future<List<QuizResultEntity>> getAllCourseQuiz() async {
    List<QuizResultEntity> tempList = [];

    final user = Supabase.instance.client.auth.currentUser;

    final fetchQuiz = await Supabase.instance.client
        .from("user")
        .select("quiz")
        .eq("uid", user!.id)
        .select("quiz");

    final getAllQuiz =
        List<Map<String, dynamic>>.from(fetchQuiz[0]["quiz"][0]["data"]);

    for (final quiz in getAllQuiz) {
      tempList.add(QuizResultEntity.fromJson(quiz));
    }

    return tempList;
  }

  @override
  Future<CourseEntity> getCourseDetail(int courseId) async {
    final data = await Supabase.instance.client
        .from("course")
        .select("*")
        .eq("id", courseId)
        .single();

    return CourseEntity.fromJson(data);
  }
}
