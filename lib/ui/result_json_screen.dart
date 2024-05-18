import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/events/get_result_event.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';
import 'package:task1/helpers/utils.dart';

import '../widget/common_widget.dart';

class ResultJsonScreen extends StatelessWidget {
  const ResultJsonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ResultBloc, ResultState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.resultReqState == ResultReqState.SUCCESS) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    jsonCardWidget(
                        title: "bounds",
                        value: getPrettyJSONString(
                            (state.resultModel?.routes ?? []).first.bounds!),
                        context: context),
                    jsonCardWidget(
                        title: "legs",
                        value: getPrettyJSONString(
                            (state.resultModel?.routes ?? [])
                                .first
                                .legs!
                                .first),
                        context: context),
                  ],
                ),
              );
            } else if (state.resultReqState == ResultReqState.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.resultReqState == ResultReqState.ERROR) {
              return Center(
                child: Text(state.errorMessage ?? ""),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(translate("click_data")),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        getResultBloc()?.add(GetResultEvent());
                      },
                      child: Text(translate("get_data")))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
