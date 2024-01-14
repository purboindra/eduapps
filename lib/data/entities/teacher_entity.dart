import 'package:json_annotation/json_annotation.dart';

part 'teacher_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TeacherEntity {
  int? id;
  String? name;
  String? subject;
  String? photoUrl;
  DateTime? createdAt;

  TeacherEntity({
    this.createdAt,
    this.id,
    this.name,
    this.photoUrl,
    this.subject,
  });

  factory TeacherEntity.fromJson(Map<String, dynamic> json) =>
      _$TeacherEntityFromJson(json);
}
