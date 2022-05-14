import '../model/item.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Item note;
  SubmitEvent({required this.note});
}

class DeleteEvent extends ManageEvent {
  String noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  String noteId;
  Item previousNote;
  UpdateRequest({required this.noteId, required this.previousNote});
}

class UpdateCancel extends ManageEvent {}