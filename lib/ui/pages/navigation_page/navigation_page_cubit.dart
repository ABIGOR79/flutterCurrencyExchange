import 'package:flutter_app/ui/pages/navigation_page/navigation_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPageCubit extends Cubit<NavigationPageState> {
  NavigationPageCubit() : super(NavigationPageState());

  updateSelectedPage(int index) {
    emit(state.copyWith(screenIndex: index));
  }
}
