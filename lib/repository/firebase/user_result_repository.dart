import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/user_note.dart';
import 'package:hive/hive.dart';

class UserNotesRepository {
  static const String collectionName = "user_notes";

  static Future<void> addNewUserNote(String noteId) async {
    final userBox = Hive.box<User>('users');

    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0);

      final userNote = UserNote(
        noteId: noteId,
        userId: user?.username ?? 'unknown_user',
      );

      await FirebaseFirestore.instance
          .collection(collectionName)
          .add(userNote.toJson());
    } else {
      throw Exception('No user found in Hive storage');
    }
  }

  static Future<List<UserNote>> fetchUserNotes() async {
    final userBox = Hive.box<User>('users');

    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0);
      debugPrint('Current user in Hive: ${user?.username}');

      final querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('userId', isEqualTo: user?.username ?? 'unknown_user')
          .get();

      debugPrint('Fetched documents count: ${querySnapshot.docs.length}');
      for (var doc in querySnapshot.docs) {
        debugPrint('Document data: ${doc.data()}');
      }

      return querySnapshot.docs
          .map((doc) => UserNote.fromJson(doc.data()))
          .toList();
    } else {
      debugPrint('No user found in Hive storage');
      throw Exception('No user found in Hive storage');
    }
  }
}
