import 'item.dart';

class ItemCollection {
  List<String> idList = [];
  List<Item> itemList = [];

  ItemCollection() {
    idList = [];
    itemList = [];
  }

  int length() {
    return idList.length;
  }

  Item getItemAtIndex(int index) {
    return itemList[index];
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

  updateOrInsertItemOfId(String id, Item item) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList[index] = item;
    } else {
      idList.add(id);
      itemList.add(item);
    }
  }

  updateItemOfId(String id, Item item) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList[index] = item;
    }
  }

  deleteItemOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertItemOfId(String id, Item item) {
    idList.add(id);
    itemList.add(item);
  }
}