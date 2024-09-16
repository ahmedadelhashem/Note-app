import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   int color;
  @HiveField(2)
  final String data;
  @HiveField(3)
   String subtitle;

  NoteModel({required this.title, required this.color, required this.data, required this.subtitle});
}