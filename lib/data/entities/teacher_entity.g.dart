// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherEntity _$TeacherEntityFromJson(Map<String, dynamic> json) =>
    TeacherEntity(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?,
      subject: json['subject'] as String?,
    );

Map<String, dynamic> _$TeacherEntityToJson(TeacherEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subject': instance.subject,
      'photo_url': instance.photoUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
