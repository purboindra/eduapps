// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResultEntity _$QuizResultEntityFromJson(Map<String, dynamic> json) =>
    QuizResultEntity(
      score: json['score'] as int?,
      question: json['question'] as String?,
      courseId: json['course_id'] as int?,
      isCorrect: json['is_correct'] as bool?,
      questionId: json['question_id'] as int?,
    );

Map<String, dynamic> _$QuizResultEntityToJson(QuizResultEntity instance) =>
    <String, dynamic>{
      'score': instance.score,
      'question': instance.question,
      'course_id': instance.courseId,
      'is_correct': instance.isCorrect,
      'question_id': instance.questionId,
    };
