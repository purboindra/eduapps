// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseEntity _$CourseEntityFromJson(Map<String, dynamic> json) => CourseEntity(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CourseEntityToJson(CourseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
