import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/notes.dart';

class NotesRepository {
  static const String collectionName = "notes";

  static Future<DocumentReference<Map<String, dynamic>>> addNewNote(
      NoteRequest note) async {
    final notesCollection =
        FirebaseFirestore.instance.collection(collectionName);

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await notesCollection.doc(note.key).get();

    if (!documentSnapshot.exists) {
      await notesCollection.doc(note.key).set(note.toJson());
    }
    return notesCollection.doc(note.key);
  }

  Future<List<NoteRequest>> fetchNotes() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    return querySnapshot.docs
        .map((e) => NoteRequest.fromJson(e.data()))
        .toList();
  }
}
