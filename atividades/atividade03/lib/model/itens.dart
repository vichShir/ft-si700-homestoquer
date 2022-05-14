import 'item.dart';

class ItemCollection {
  List<String> idList = [];
  List<Item> noteList = [];

  ItemCollection() {
    idList = [];
    noteList = [];
  }

  int length() {
    return idList.length;
  }

  Item getNodeAtIndex(int index) {
    return noteList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertNoteOfId(String id, Item note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    } else {
      idList.add(id);
      noteList.add(note);
    }
  }

  updateNoteOfId(String id, Item note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    }
  }

  deleteNoteOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(String id, Item note) {
    idList.add(id);
    noteList.add(note);
  }
}