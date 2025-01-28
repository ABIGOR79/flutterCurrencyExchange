import 'package:flutter_app/models/note_request.dart';

enum NoteSortOrder { byName, byContent, byCreatedDate }

class ProfileState {
  final List<NoteRequest> notelist;
  final NoteSortOrder sortOrder;

  ProfileState({
    required this.notelist,
    this.sortOrder = NoteSortOrder.byName,
  });

  ProfileState copyWith({
    List<NoteRequest>? notelist,
    NoteSortOrder? sortOrder,
  }) {
    return ProfileState(
      notelist: notelist ?? this.notelist,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
