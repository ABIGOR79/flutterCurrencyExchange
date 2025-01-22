import 'package:flutter/material.dart';
import 'package:flutter_app/repository/test/test_repository.dart';
import 'package:flutter_app/ui/pages/test_page/test_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPageCubit extends Cubit<TestPageState> {
  TestPageCubit()
      : super(TestPageState(
            isLoading: false, myList: <String>[], isState: false));

  final test = TestRepository();
  Future<List<String>> getSameList(bool currentState) async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(Duration(seconds: 2));
      final myList = await test.getList(network: currentState);
      emit(state.copyWith(myList: myList, isLoading: false));
      return myList;
    } catch (e) {
      debugPrint('$e');
      emit(state.copyWith(isLoading: false));
      return [];
    }
  }

  void switchState() {
    final newState = !state.isState;
    emit(state.copyWith(isState: newState));
    getSameList(newState);
  }
}
