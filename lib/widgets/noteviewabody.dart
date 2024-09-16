import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/cubit/notes_cubit.dart';
import 'package:noteapp/widgets/notes_list_views.dart';

class NotesviewsBody extends StatefulWidget {
  const NotesviewsBody({super.key});

  @override
  State<NotesviewsBody> createState() => _NotesviewsBodyState();
}

class _NotesviewsBodyState extends State<NotesviewsBody> {
   void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Text(
                'Notes',
                style: TextStyle(fontSize: 28),
              ),
              Spacer(),
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.05),
                    borderRadius: BorderRadius.circular(18)),
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              )
            ],
          ),
          Expanded(child: Noteslistview())
        ],
      ),
    );
  }
}
