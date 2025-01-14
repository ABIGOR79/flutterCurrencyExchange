class NavigationPageState {
  int screenIndex;

  NavigationPageState({this.screenIndex = 0});

  NavigationPageState copyWith({screenIndex}) {
    return NavigationPageState(screenIndex: screenIndex ?? this.screenIndex);
  }
}
