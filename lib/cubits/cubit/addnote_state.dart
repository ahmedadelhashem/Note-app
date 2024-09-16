part of 'addnote_cubit.dart';

@immutable
sealed class AddnoteState {}

final class AddnoteInitial extends AddnoteState {}
class AddNoteLoading extends AddnoteState{}
class AddNoteSucess extends AddnoteState{}
class AddNoteFailure extends AddnoteState{
  final String errMessage;
AddNoteFailure(this.errMessage);
}
