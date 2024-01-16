import 'package:education_app/app/utils/app_print.dart';
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
    // final responsA = await Supabase.instance.client
    //     .from("user")
    //     .select("courses")
    //     .eq("uid", "374b32a0-ec7d-42fd-971f-cc2c1feed91b");
    // for (final a in responsA) {
    //   for (final b in a["courses"]) {
    //     AppPrint.debugPrint("APAIUT $b");
    //     final responsA = await Supabase.instance.client
    //         .from("quiz")
    //         .select("*")
    //         .eq("course_id", "$b");
    //     for (final s in responsA) {
    //       AppPrint.debugPrint("QUIZ $s");
    //     }
    //   }
    //   AppPrint.debugPrint("RESPONSE A ${a["courses"]}");
    // }
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
  Future<List<CourseEntity>> getAllCourse(List<int> courseIds) async {
    List<CourseEntity> tempCourse = [];
    for (final courseId in courseIds) {
      final data = await Supabase.instance.client
          .from("course")
          .select("*")
          .eq("id", courseId.toString());
      for (final course in data) {
        AppPrint.debugPrint("GET COURSE $course");
        tempCourse.add(CourseEntity.fromJson(course));
      }
    }
    return tempCourse;
  }
}
