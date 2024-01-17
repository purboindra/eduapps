import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/institution_entity.dart';
import 'package:education_app/data/entities/teacher_entity.dart';

abstract class HomeRepository {
  Future<List<TeacherEntity>> getAllTeachers();
  Future<List<InstitutionEntity>> getAllInstitutions();
  Future<List<CourseEntity>> getAllCourse(List<String> courseIds);
}
