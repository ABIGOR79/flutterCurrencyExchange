import 'package:json_annotation/json_annotation.dart';

part 'saved_notes.g.dart';

@JsonSerializable()
class SavedResponse {
  @JsonKey(name: "resultId")
  final String? resultId;
  @JsonKey(name: "userId")
  final String? userId;

  SavedResponse({required this.resultId, required this.userId});

  factory SavedResponse.fromJson(Map<String, dynamic> json) =>
      _$SavedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SavedResponseToJson(this);
}
