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
      final myList = await test.getList(network: state.isState);
      emit(state.copyWith(myList: myList, isLoading: false));
      return myList;
    } catch (e) {
      debugPrint('$e');
      return [];
    }
  }

  void switchState() {
    final newState = !state.isState;
    emit(state.copyWith(isState: newState));
    getSameList(newState);
  }
}
