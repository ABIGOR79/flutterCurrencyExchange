import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileCubit extends Cubit<String> {
  final SharedPreferences _prefs;

  ProfileCubit(this._prefs) : super(_prefs.getString('username') ?? '');

  void updateUsername(String newName) {
    _prefs.setString('username', newName);
    emit(newName);
  }
}
