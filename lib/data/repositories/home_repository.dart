import 'package:education_app/data/entities/teacher_entity.dart';
import 'package:education_app/domain/repositories/home_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<TeacherEntity>> getAllTeachers() async {
    List<TeacherEntity> teachers = [];
    final response =
        await Supabase.instance.client.from("teachers").select("*");
    for (final teacher in response) {
      teachers.add(TeacherEntity.fromJson(teacher));
    }
    return teachers;
  }
}
