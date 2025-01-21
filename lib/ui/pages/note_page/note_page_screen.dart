import 'package:flutter/material.dart';
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
    cubit.fetchUserNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotePageCubit, NotePageState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.note),
            title: const Text('My Notes'),
          ),
          body: SafeArea(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null
                    ? Center(child: Text('Ошибка: ${state.errorMessage}'))
                    : state.listNotes.isEmpty
                        ? const Center(child: Text('Нет заметок'))
                        : ListView.builder(
                            itemCount: state.listNotes.length,
                            itemBuilder: (context, index) {
                              final note = state.listNotes[index];
                              return ListTile(
                                title: Text(note.name),
                                subtitle: Text(note.content),
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
