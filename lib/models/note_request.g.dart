// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteRequest _$NoteRequestFromJson(Map<String, dynamic> json) => NoteRequest(
      name: json['name'] as String,
      content: json['content'] as String,
      key: json['key'] as String,
      createdDate: (json['createdDate'] as num).toInt(),
      updatedDate: (json['updatedDate'] as num).toInt(),
    );

Map<String, dynamic> _$NoteRequestToJson(NoteRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content': instance.content,
      'key': instance.key,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
    };
