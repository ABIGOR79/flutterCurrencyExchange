import 'package:flutter_app/models/note_request.dart';

class NotePageState {
  final bool isLoading;
  final List<NoteRequest> listNotes;
  final String? errorMessage;
  final bool showFavorites;

  NotePageState({
    required this.isLoading,
    required this.listNotes,
    this.errorMessage,
    this.showFavorites = false,
  });

  NotePageState copyWith({
    bool? isLoading,
    List<NoteRequest>? listNotes,
    String? errorMessage,
    bool? showFavorites,
  }) {
    return NotePageState(
      isLoading: isLoading ?? this.isLoading,
      listNotes: listNotes ?? this.listNotes,
      errorMessage: errorMessage ?? this.errorMessage,
      showFavorites: showFavorites ?? this.showFavorites,
    );
  }
}
