// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstitutionEntity _$InstitutionEntityFromJson(Map<String, dynamic> json) =>
    InstitutionEntity(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photo_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      subject: json['subject'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$InstitutionEntityToJson(InstitutionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'photo_url': instance.photoUrl,
      'rating': instance.rating,
      'subject': instance.subject,
      'created_at': instance.createdAt?.toIso8601String(),
    };
