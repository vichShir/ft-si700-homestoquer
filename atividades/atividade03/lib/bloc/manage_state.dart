import '../model/item.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String noteId;
  Item previousNote;
  UpdateState({required this.noteId, required this.previousNote});
}