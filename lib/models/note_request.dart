import 'package:json_annotation/json_annotation.dart';

part 'note_request.g.dart';

@JsonSerializable()
class NoteRequest {
  final String name;
  final String content;
  final String key;
  final int createdDate;
  final int updatedDate;
  final bool isChecked;

  NoteRequest(
      {required this.name,
      required this.content,
      required this.key,
      required this.createdDate,
      required this.updatedDate,
      required this.isChecked});

  NoteRequest copyWith({bool? isChecked}) {
    return NoteRequest(
      name: name,
      content: content,
      key: key,
      createdDate: createdDate,
      updatedDate: updatedDate,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  factory NoteRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NoteRequestToJson(this);
}
