import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../modal/result_model.dart';

part 'events/result_event.dart';

part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultState()) {
    on<ResultEvent>(_processEvent);
  }

  _processEvent(ResultEvent event, Emitter<ResultState> emit) async {
    await event.execute(this, emit);
  }
}
