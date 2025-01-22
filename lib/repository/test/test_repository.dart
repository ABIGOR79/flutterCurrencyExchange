import 'package:flutter/material.dart';

class TestRepository {
  final newList = <String>['Alastor', 'Andramelh', 'Alstor', 'Abigor', 'Anku'];
  final oldList = <String>['Shasha', 'Petya', 'Stas', 'Vanya', 'Zhenya'];
  List<String> sendList = <String>[];

  Future<List<String>> getList({bool network = true}) async {
    try {
      if (network) {
        sendList = newList;
        return sendList;
      } else {
        sendList = oldList;
        return sendList;
      }
    } catch (e) {
      debugPrint('$e');
      return <String>[];
    }
  }
}
