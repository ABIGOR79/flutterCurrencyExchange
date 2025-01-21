import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/note_request.dart';

import 'package:flutter_app/repository/firebase/network_repository.dart';
import 'package:flutter_app/repository/firebase/user_resulr_repository.dart';
import 'package:flutter_app/ui/pages/note_page/note_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotePageCubit extends Cubit<NotePageState> {
  NotePageCubit() : super(NotePageState(isLoading: false, listNotes: []));

  Future<void> fetchUserNotes() async {
    emit(state.copyWith(isLoading: true));

    try {
      final userNotes = await UserNotesRepository.fetchUserNotes();

      // Получаем все заметки параллельно с помощью Future.wait
      final fetchedNotes = await Future.wait(userNotes.map((userNote) async {
        final noteSnapshot = await FirebaseFirestore.instance
            .collection(NotesRepository.collectionName)
            .doc(userNote.noteId)
            .get();

        final data = noteSnapshot.data();
        if (noteSnapshot.exists && data != null) {
          try {
            return NoteRequest.fromJson(data);
          } catch (e) {
            debugPrint('Ошибка при парсинге данных: $e');
          }
        }
        return null;
      }));

      emit(state.copyWith(
        isLoading: false,
        listNotes: fetchedNotes.whereType<NoteRequest>().toList(),
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
