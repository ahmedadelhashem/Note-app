import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/cubit/addnote_cubit.dart';
import 'package:noteapp/cubits/cubit/notes_cubit.dart';
import 'package:noteapp/widgets/add_note_form.dart';


class Addmodelsheet extends StatelessWidget {
  const Addmodelsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddnoteCubit(),
      child: BlocConsumer<AddnoteCubit, AddnoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddNoteSucess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading?true:false,
            child: Padding(
              padding:  EdgeInsets.only(left: 16.0,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddnoteForm()),
            ),
          );
        },
      ),
    );
  }
}
