import 'package:flutter_app/models/note_request.dart';

class NotePageState {
  final bool isLoading;
  final List<NoteRequest> listNotes;
  final String? errorMessage;

  NotePageState({
    required this.isLoading,
    required this.listNotes,
    this.errorMessage,
  });

  NotePageState copyWith(
      {bool? isLoading, List<NoteRequest>? listNotes, String? errorMessage}) {
    return NotePageState(
      isLoading: isLoading ?? this.isLoading,
      listNotes: listNotes ?? this.listNotes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
