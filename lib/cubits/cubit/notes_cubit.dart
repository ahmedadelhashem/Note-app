import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes()  {
      var notesbox = Hive.box<NoteModel>('notes_box');
      notes=notesbox.values.toList();
      emit(NoteSucess());
  }
}
