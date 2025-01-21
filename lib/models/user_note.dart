import 'package:json_annotation/json_annotation.dart';

part 'user_note.g.dart';

@JsonSerializable()
class UserNote {
  final String noteId;
  final String userId;

  UserNote({
    required this.noteId,
    required this.userId,
  });

  factory UserNote.fromJson(Map<String, dynamic> json) =>
      _$UserNoteFromJson(json);

  Map<String, dynamic> toJson() => _$UserNoteToJson(this);
}
