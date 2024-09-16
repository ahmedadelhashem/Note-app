import 'package:flutter/material.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/widgets/Edit_notes_body.dart';

class EditNotesViews extends StatelessWidget {
  const EditNotesViews({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteviewsvody(note:note ,),
    );
  }
}

