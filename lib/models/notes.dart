import 'package:json_annotation/json_annotation.dart';

part 'notes.g.dart';

@JsonSerializable()
class NoteRequest {
  final String name;
  final String content;
  final String key;
  final int createdDate;
  final int updatedDate;

  NoteRequest({
    required this.name,
    required this.content,
    required this.key,
  })  : createdDate = DateTime.now().millisecondsSinceEpoch,
        updatedDate = DateTime.now().millisecondsSinceEpoch;

  factory NoteRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NoteRequestToJson(this);
}
