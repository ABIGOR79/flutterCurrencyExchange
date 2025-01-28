import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_tile_note.dart';

import 'package:flutter_app/ui/pages/note_page/note_page_cubit.dart';
import 'package:flutter_app/ui/pages/note_page/note_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotePageScreen extends StatefulWidget {
  const NotePageScreen({super.key});

  @override
  State<NotePageScreen> createState() => _NotePageScreenState();
}

class _NotePageScreenState extends State<NotePageScreen> {
  final cubit = NotePageCubit();

  @override
  void initState() {
    super.initState();
    cubit.fetchUserNotes().then((_) {
      cubit.fetchFavoriteNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotePageCubit, NotePageState>(
      bloc: cubit,
      builder: (context, state) {
        final filteredNotes = state.showFavorites
            ? state.listNotes.where((note) => note.isChecked).toList()
            : state.listNotes;

        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.note),
            title: const Text('My Notes'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: state.showFavorites ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  cubit.toggleShowFavorites();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null
                    ? Center(child: Text('Ошибка: ${state.errorMessage}'))
                    : filteredNotes.isEmpty
                        ? const Center(child: Text('Нет заметок'))
                        : ListView.builder(
                            itemCount: filteredNotes.length,
                            itemBuilder: (context, index) {
                              final note = filteredNotes[index];
                              return NoteItemWidget(
                                note: note,
                                onFavoriteToggle: () async {
                                  await cubit.toggleFavoriteStatus(
                                      note.key, note.isChecked);
                                },
                                onDelete: () async {
                                  await cubit.deleteNote(note.key);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Заметка удалена')),
                                  );
                                },
                              );
                            },
                          ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}
