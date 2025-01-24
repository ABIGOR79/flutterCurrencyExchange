import 'package:flutter/material.dart';
import '../models/note_request.dart';

class NoteItemWidget extends StatelessWidget {
  final NoteRequest note;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onDelete;

  const NoteItemWidget({
    super.key,
    required this.note,
    required this.onFavoriteToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.note, color: Colors.blueAccent),
        title: Text(
          note.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          note.content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                note.isChecked
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: note.isChecked ? Colors.green : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
