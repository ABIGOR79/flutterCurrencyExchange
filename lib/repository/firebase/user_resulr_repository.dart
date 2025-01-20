import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';
import 'package:hive/hive.dart';

class UserNotesRepository {
  static const String collectionName = "user_notes";

  static Future<void> addNewUserNote(String noteId) async {
    final userBox = Hive.box<User>('users');

    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0);

      final userNote = {
        'noteId': noteId,
        'userId': user?.username ?? 'unknown_user',
      };

      await FirebaseFirestore.instance.collection(collectionName).add(userNote);
    } else {
      throw Exception('No user found in Hive storage');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchUserNotes() async {
    final userBox = Hive.box<User>('users');

    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0);

      final querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('userId', isEqualTo: user?.username ?? 'unknown_user')
          .get();

      return querySnapshot.docs.map((e) => e.data()).toList();
    } else {
      throw Exception('No user found in Hive storage');
    }
  }
}
