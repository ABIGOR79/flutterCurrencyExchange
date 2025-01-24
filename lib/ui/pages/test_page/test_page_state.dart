class TestPageState {
  final bool isLoading;
  final List<String> myList;
  final bool isState;
  final List<String> filteredList;

  TestPageState(
      {required this.isLoading,
      required this.myList,
      required this.isState,
      required this.filteredList});

  TestPageState copyWith({
    bool? isLoading,
    List<String>? myList,
    bool? isState,
    List<String>? filteredList,
  }) {
    return TestPageState(
        isLoading: isLoading ?? this.isLoading,
        myList: myList ?? this.myList,
        isState: isState ?? this.isState,
        filteredList: filteredList ?? this.filteredList);
  }
}
