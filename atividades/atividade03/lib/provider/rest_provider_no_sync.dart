// Data Provider para o banco de dados local sqflite
import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/item.dart';
import '../model/itens.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://si7001s2022-b1472-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

  Future<Item> getItem(noteId) async {
    Response response = await _dio.get(prefixUrl + noteId + suffixUrl);
    return Item.fromMap(response.data);
  }

  Future<void> insertNote(Item note) async {
    Response response = await _dio.post(
      prefixUrl + suffixUrl,
      data: note.toMap(),
    );
    //return 42;
  }

  Future<int> updateNote(noteId, Item note) async {
    Response response = await _dio.put(
      prefixUrl + "/" + noteId + suffixUrl,
      data: note.toMap(),
    );
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    Response response = await _dio.delete(prefixUrl + "/" + noteId + suffixUrl);
    return 42;
  }

  Future<ItemCollection> getNoteList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);
    ItemCollection noteCollection = ItemCollection();

    response.data.forEach((key, value) {
      Item note = Item.fromMap(value);
      noteCollection.insertNoteOfId(key, note);
    });
    return noteCollection;
  }
}