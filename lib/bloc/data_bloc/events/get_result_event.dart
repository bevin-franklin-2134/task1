import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';

import '../../../helpers/api_helper.dart';

class GetResultEvent extends ResultEvent {
  @override
  execute(ResultBloc bloc, Emitter<ResultState> emit) async {
    try {
      emit(bloc.state.copyWith(resultReqState: ResultReqState.LOADING));
      var res = await APIHelper().getResult();
      emit(bloc.state.copyWith(resultReqState: ResultReqState.SUCCESS,resultModel: res));
    } catch (e) {
      debugPrint('Error in GetResultEvent \n$e');
      emit(bloc.state.copyWith(
          resultReqState: ResultReqState.ERROR, errorMessage: e.toString()));
    }
  }
}
