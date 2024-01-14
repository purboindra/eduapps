import 'package:education_app/data/entities/teacher_entity.dart';

abstract class HomeRepository {
  Future<List<TeacherEntity>> getAllTeachers();
}
