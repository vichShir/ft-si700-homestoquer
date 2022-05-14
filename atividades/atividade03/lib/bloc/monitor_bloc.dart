import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/itens.dart';
import '../provider/rest_provider_no_sync.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  ItemCollection noteCollection = ItemCollection();

  MonitorBloc() : super(MonitorState(noteCollection: ItemCollection())) {
    on<AskNewList>((event, emit) async {
      noteCollection = await RestServer.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    add(AskNewList());
  }
}