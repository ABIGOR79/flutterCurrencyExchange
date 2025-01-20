// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteRequest _$NoteRequestFromJson(Map<String, dynamic> json) => NoteRequest(
      name: json['name'] as String,
      content: json['content'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$NoteRequestToJson(NoteRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content': instance.content,
      'key': instance.key,
    };
