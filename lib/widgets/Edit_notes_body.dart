import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/cubit/addnote_cubit.dart';
import 'package:noteapp/cubits/cubit/notes_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/widgets/Color_list_view.dart';

class EditNoteviewsvody extends StatefulWidget {
  const EditNoteviewsvody({
    super.key, required this.note,
  });
 final NoteModel note;

  @override
  State<EditNoteviewsvody> createState() => _EditNoteviewsvodyState();
}

class _EditNoteviewsvodyState extends State<EditNoteviewsvody> {
  String? title,content;
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
                'Edit Note',
                style: TextStyle(fontSize: 28),
              ),
              Spacer(),
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.05),
                    borderRadius: BorderRadius.circular(18)),
                child: IconButton(onPressed: (){
                  widget.note.title=title??widget.note.title;
                  widget.note.subtitle=content??widget.note.subtitle;
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  widget.note.save();
                  Navigator.pop(context);
                }, icon: Icon(Icons.check))
              )
            ],
          ),
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
            TextField(
              onChanged: (value) {
                title=value;
              },
              maxLines: 1,
              cursorColor:  Color(0xff62FCD7),
              decoration: InputDecoration(
              hintText: widget.note.title,
              hintStyle: TextStyle(color:  Color(0xff62FCD7)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xff62FCD7))
              ) 
            ),
            ),
            SizedBox(height: 15,),
            TextField(
              onChanged: (value) {
                content=value;
              },
              maxLines: 5,
              cursorColor:  Color(0xff62FCD7),
              decoration: InputDecoration(
              hintText: widget.note.subtitle,
              hintStyle: TextStyle(color:  Color(0xff62FCD7)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xff62FCD7))
              ) 
            ),
            ),
            SizedBox(height: 40,),
            // cutombutton(),
            //  SizedBox(height: 10,),
            EditNoteColorlist(note: widget.note,)
          ],
        ),
      ),
    )
        ],
      ),
    );
  }
}

class EditNoteColorlist extends StatefulWidget {
  const EditNoteColorlist({super.key, required this.note});
 final NoteModel note;
  @override
  State<EditNoteColorlist> createState() => _EditNoteColorlistState();
}

class _EditNoteColorlistState extends State<EditNoteColorlist> {
 late int currentindex ;
void initState(){
 currentindex=colors.indexOf(Color(widget.note.color));
 super.initState();
 }

  List<Color> colors = [
    Color(0xff011627),
    Color(0xff091B27),
    Color(0xff111F27),
    Color(0xff212826),
    Color(0xff413925),
    Color(0xff614A24),
    Color(0xff805B22),
    Color(0xffC07D1F),
    Color(0xffFF9F1C),
    Color(0xffF71735),
    Color(0xffFDFFFC),
    Color(0xff41EAD4),
     ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                  onTap: () {
                    currentindex = index;
                    widget.note.color=colors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(isActive: currentindex == index, color: colors[index],)),
            );
          }),
    );
  }
}