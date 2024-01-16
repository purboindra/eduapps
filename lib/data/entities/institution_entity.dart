import 'package:json_annotation/json_annotation.dart';

part 'institution_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class InstitutionEntity {
  int? id;
  String? title;
  String? description;
  String? photoUrl;
  double? rating;
  String? subject;
  DateTime? createdAt;
  InstitutionEntity({
    this.id,
    this.title,
    this.description,
    this.photoUrl,
    this.rating,
    this.subject,
    this.createdAt,
  });

  factory InstitutionEntity.fromJson(Map<String, dynamic> json) =>
      _$InstitutionEntityFromJson(json);
}
