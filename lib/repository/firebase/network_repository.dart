import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkRepository {
  static const String repostable = "notes";

  final resultsCollection =
      FirebaseFirestore.instance.collection(NetworkRepository.repostable);
}
