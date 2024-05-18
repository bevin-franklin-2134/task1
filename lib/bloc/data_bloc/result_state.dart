part of 'result_bloc.dart';

class ResultState {
  ResultReqState? resultReqState;
  String? errorMessage;
  ResultModel? resultModel;

  ResultState(
      {this.resultReqState = ResultReqState.NONE,
      this.errorMessage = '',
      this.resultModel});

  ResultState copyWith(
          {ResultReqState? resultReqState,
          String? errorMessage,
          ResultModel? resultModel}) =>
      ResultState(
          errorMessage: errorMessage ?? this.errorMessage,
          resultReqState: resultReqState ?? this.resultReqState,
          resultModel: resultModel ?? this.resultModel);
}

enum ResultReqState { NONE, LOADING, SUCCESS, ERROR }
