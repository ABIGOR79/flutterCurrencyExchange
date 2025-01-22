import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/profile/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = GetIt.instance<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Center(
        child: BlocBuilder<ProfileCubit, String>(
          bloc: profileCubit,
          builder: (context, username) {
            return username.isNotEmpty
                ? Text('Имя пользователя: $username',
                    style: TextStyle(fontSize: 20))
                : Text('Имя пользователя не найдено');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profileCubit.updateUsername("Новый пользователь");
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
