import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/profile/profile_cubit.dart';
import 'package:flutter_app/ui/pages/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileCubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  profileCubit.setSortOrder(NoteSortOrder.byName);
                },
                child: Text('По имени'),
              ),
              ElevatedButton(
                onPressed: () {
                  profileCubit.setSortOrder(NoteSortOrder.byContent);
                },
                child: Text('По контенту'),
              ),
              ElevatedButton(
                onPressed: () {
                  profileCubit.setSortOrder(NoteSortOrder.byCreatedDate);
                },
                child: Text('По времени'),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              bloc: profileCubit,
              builder: (context, state) {
                final sortedNotes = profileCubit.sortedNotes;

                return sortedNotes.isNotEmpty
                    ? ListView.builder(
                        itemCount: sortedNotes.length,
                        itemBuilder: (context, i) {
                          final note = sortedNotes[i];
                          return ListTile(
                            title: Text(note.name),
                            subtitle: Text(note.content),
                          );
                        },
                      )
                    : Center(child: Text('Заметок не найдено'));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profileCubit.getList();
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
