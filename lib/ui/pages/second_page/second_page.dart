import 'package:flutter/material.dart';
import 'package:flutter_app/models/note_request.dart';

import 'package:flutter_app/repository/firebase/network_repository.dart';
import 'package:flutter_app/repository/firebase/user_result_repository.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _saveNote() async {
    final name = _nameController.text.trim();
    final content = _contentController.text.trim();
    if (name.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Заполните все поля')));
      return;
    }

    final note = NoteRequest(
        name: name,
        content: content,
        key: name,
        createdDate: DateTime.now().millisecondsSinceEpoch,
        updatedDate: DateTime.now().millisecondsSinceEpoch);

    await NotesRepository.addNewNote(note);
    await UserNotesRepository.addNewUserNote(note.key);

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Заметка сохранена')));

      _nameController.clear();
      _contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить заметку')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Название заметки'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Содержание'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
