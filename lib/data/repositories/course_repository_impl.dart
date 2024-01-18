import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/domain/repositories/course_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<CourseEntity> getDetailCourse(int courseId) async {
    final response = await Supabase.instance.client
        .from("course")
        .select("*")
        .eq("id", courseId);

    return CourseEntity.fromJson(response[0]);
  }
}
