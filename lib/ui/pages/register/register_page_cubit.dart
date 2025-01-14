import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/ui/pages/register/register_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  Future<void> registerUser(String username, String password) async {
    emit(state.copyWith(isSubmitting: true));

    try {
      final box = Hive.box<User>('users');

      final isUserExists = box.values.any((user) => user.username == username);
      if (isUserExists) {
        emit(state.copyWith(isSubmitting: false, isError: true));
        return;
      }

      final newUser = User(username: username, password: password);
      await box.add(newUser);

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, isError: true));
    }
  }
}
