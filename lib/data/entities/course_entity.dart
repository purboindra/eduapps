import 'package:json_annotation/json_annotation.dart';

part 'course_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CourseEntity {
  int? id;

  String? title;

  @JsonKey(name: "image_url")
  String? imageUrl;

  String? description;

  CourseEntity({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
  });

  factory CourseEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseEntityFromJson(json);
}
