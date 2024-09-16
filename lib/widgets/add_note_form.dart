import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubits/cubit/addnote_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/widgets/Color_list_view.dart';
import 'package:noteapp/widgets/custom_button.dart';

class AddnoteForm extends StatefulWidget {
  const AddnoteForm({
    super.key,
  });

  @override
  State<AddnoteForm> createState() => _AddnoteFormState();
}
class _AddnoteFormState extends State<AddnoteForm> {
  @override
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle, data;
  Widget build(BuildContext context) {
    void Function(String?)? onsaved;
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'field is required';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              title = value;
            },
            maxLines: 1,
            cursorColor: Color(0xff62FCD7),
            decoration: InputDecoration(
                hintText: 'title',
                hintStyle: TextStyle(color: Color(0xff62FCD7)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff62FCD7)))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'field is required';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              subtitle = value;
            },
            maxLines: 8,
            cursorColor: Color(0xff62FCD7),
            decoration: InputDecoration(
                hintText: 'content',
                hintStyle: TextStyle(color: Color(0xff62FCD7)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff62FCD7)))),
          ),
          SizedBox(
            height: 15,
          ),
          ColorsListView(),
          SizedBox(height: 15,),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return cutombutton(
                isloading: state is AddNoteLoading?true:false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentData=DateTime.now();
                    var formatcurrentData=DateFormat.yMEd().format(currentData);
                    var notemodel = NoteModel(
                        title: title!,
                        color: Colors.amber.value,
                        data: formatcurrentData,
                        subtitle: subtitle!);
                    BlocProvider.of<AddnoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
