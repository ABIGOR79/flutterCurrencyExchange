class TestPageState {
  final bool isLoading;
  final List<String> myList;
  final bool isState;

  TestPageState(
      {required this.isLoading, required this.myList, required this.isState});

  TestPageState copyWith({
    bool? isLoading,
    List<String>? myList,
    bool? isState,
  }) {
    return TestPageState(
        isLoading: isLoading ?? this.isLoading,
        myList: myList ?? this.myList,
        isState: isState ?? this.isState);
  }
}
