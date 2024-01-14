import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/domain/repositories/introduction_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IntroductionRepositoryImpl implements IntroductionRepository {
  @override
  Future<List<CourseEntity>> getAllCourse() async {
    List<CourseEntity> courses = [];
    final response = await Supabase.instance.client.from("course").select("*");
    for (final course in response) {
      courses.add(CourseEntity.fromJson(course));
    }
    return courses;
  }
}
