import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/saved_notes.dart';
import 'package:flutter_app/models/user.dart';
import 'package:hive/hive.dart';

class SaveUserNote {
  static const String collectionName = 'saved';

  static Future<void> deleteFromSaved(String notekey) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(notekey)
        .delete();
  }

  static Future<void> addNewUserNote(String resultId) async {
    final userBox = Hive.box<User>('users');

    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0);

      final savedNote = SavedResponse(
        resultId: resultId,
        userId: user?.username ?? 'unknown_user',
      );

      await FirebaseFirestore.instance
          .collection(collectionName)
          .add(savedNote.toJson());
    } else {
      throw Exception('No user found in Hive storage');
    }
  }
}
