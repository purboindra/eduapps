// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizEntity _$QuizEntityFromJson(Map<String, dynamic> json) => QuizEntity(
      quizId: json['quiz_id'] as int?,
      question: json['question'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctAnswer: json['correct_option'] as String?,
      courseId: json['course_id'] as int?,
    );

Map<String, dynamic> _$QuizEntityToJson(QuizEntity instance) =>
    <String, dynamic>{
      'quiz_id': instance.quizId,
      'question': instance.question,
      'options': instance.options,
      'correct_option': instance.correctAnswer,
      'course_id': instance.courseId,
    };
