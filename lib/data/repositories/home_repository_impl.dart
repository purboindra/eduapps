import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/institution_entity.dart';
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

  @override
  Future<List<InstitutionEntity>> getAllInstitutions() async {
    List<InstitutionEntity> tempInstitution = [];
    final response =
        await Supabase.instance.client.from("institution").select("*");

    for (final institution in response) {
      tempInstitution.add(InstitutionEntity.fromJson(institution));
    }
    return tempInstitution;
  }

  @override
  Future<List<CourseEntity>> getAllCourse(List<String> courseIds) async {
    List<CourseEntity> tempCourse = [];
    for (final courseId in courseIds) {
      final data = await Supabase.instance.client
          .from("course")
          .select("*")
          .eq("id", courseId.toString());
      for (final course in data) {
        tempCourse.add(CourseEntity.fromJson(course));
      }
    }
    return tempCourse;
  }
}
