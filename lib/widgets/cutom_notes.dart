import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/cubit/notes_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/edit_notes_views.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditNotesViews(note: note,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20,left: 10),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom:10 ),
                child: Text(note.subtitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 20)),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(
                    size: 35,
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(note.data,
                  style: TextStyle(color: Colors.black.withOpacity(0.4))),
            )
          ],
        ),
      ),
    );
  }
}
