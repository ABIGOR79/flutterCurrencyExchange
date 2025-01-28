import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/note_request.dart';
import 'package:flutter_app/models/user.dart';

import 'package:flutter_app/repository/firebase/network_repository.dart';
import 'package:flutter_app/repository/firebase/user_result_repository.dart';
import 'package:flutter_app/repository/firebase/user_saved_repository.dart';
import 'package:flutter_app/ui/pages/note_page/note_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class NotePageCubit extends Cubit<NotePageState> {
  NotePageCubit() : super(NotePageState(isLoading: false, listNotes: []));

  Future<void> fetchUserNotes() async {
    emit(state.copyWith(isLoading: true));

    try {
      final userNotes = await UserNotesRepository.fetchUserNotes();
      debugPrint('User notes fetched: ${userNotes.length}');

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
            debugPrint(
                'Ошибка при парсинге данных заметки ${userNote.noteId}: $e');
          }
        }
        return null;
      }));

      emit(state.copyWith(
        isLoading: false,
        listNotes: fetchedNotes.whereType<NoteRequest>().toList(),
      ));
      debugPrint('Total notes processed: ${fetchedNotes.length}');
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      debugPrint('Error fetching notes: $e');
    }
  }

  Future<void> deleteNote(String noteKey) async {
    try {
      await NotesRepository.deleteNote(noteKey);
      await SaveUserNote.deleteFromSaved(noteKey);

      final updatedNotes =
          state.listNotes.where((note) => note.key != noteKey).toList();

      emit(state.copyWith(listNotes: updatedNotes));

      debugPrint('Заметка удалена: $noteKey');
    } catch (e) {
      debugPrint('Ошибка при удалении заметки: $e');
      emit(state.copyWith(errorMessage: 'Ошибка при удалении заметки'));
    }
  }

  Future<void> toggleFavoriteStatus(String noteKey, bool isChecked) async {
    final userBox = Hive.box<User>('users');
    final user = userBox.get(0);
    if (user == null) return;

    try {
      final favoritesRef =
          FirebaseFirestore.instance.collection(SaveUserNote.collectionName);

      if (isChecked) {
        await favoritesRef
            .where('userId', isEqualTo: user.username)
            .where('resultId', isEqualTo: noteKey)
            .get()
            .then((snapshot) {
          for (var doc in snapshot.docs) {
            doc.reference.delete();
          }
        });
      } else {
        await favoritesRef.add({
          'userId': user.username,
          'resultId': noteKey,
        });
      }
      await fetchFavoriteNotes();

      debugPrint(
          'Заметка ${isChecked ? 'удалена из' : 'добавлена в'} избранное: $noteKey');
    } catch (e) {
      debugPrint('Ошибка при изменении избранного статуса: $e');
      emit(state.copyWith(errorMessage: 'Ошибка при обновлении избранного'));
    }
  }

  void toggleShowFavorites() {
    emit(state.copyWith(showFavorites: !state.showFavorites));
  }

  Future<void> fetchFavoriteNotes() async {
    final userBox = Hive.box<User>('users');
    final user = userBox.get(0);
    if (user == null) return;

    try {
      final favoritesRef = FirebaseFirestore.instance
          .collection('saved')
          .where('userId', isEqualTo: user.username);

      final snapshot = await favoritesRef.get();
      final favoriteKeys =
          snapshot.docs.map((doc) => doc['resultId'] as String).toSet();

      final updatedNotes = state.listNotes.map((note) {
        return note.copyWith(isChecked: favoriteKeys.contains(note.key));
      }).toList();

      emit(state.copyWith(listNotes: updatedNotes));

      debugPrint('Избранные заметки загружены: ${favoriteKeys.length}');
    } catch (e) {
      debugPrint('Ошибка при загрузке избранных заметок: $e');
      emit(state.copyWith(
          errorMessage: 'Ошибка при загрузке избранного списка'));
    }
  }
}
