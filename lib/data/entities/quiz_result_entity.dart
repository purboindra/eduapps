import 'package:json_annotation/json_annotation.dart';

part 'quiz_result_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuizResultEntity {
  int? score;
  String? question;
  int? courseId;
  bool? isCorrect;
  int? questionId;

  QuizResultEntity({
    this.score,
    this.question,
    this.courseId,
    this.isCorrect,
    this.questionId,
  });

  factory QuizResultEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResultEntityToJson(this);
}
