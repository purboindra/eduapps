// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'quiz_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuizEntity {
  @JsonKey(name: "id")
  int? quizId;
  String? question;
  List<String>? options;
  @JsonKey(name: "correct_option")
  String? correctAnswer;
  int? courseId;

  QuizEntity({
    this.quizId,
    this.question,
    this.options,
    this.correctAnswer,
    this.courseId,
  });

  factory QuizEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizEntityFromJson(json);
}
