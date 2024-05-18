part of '../result_bloc.dart';

@immutable
abstract class ResultEvent {
  execute(ResultBloc bloc, Emitter<ResultState> emit);
}
