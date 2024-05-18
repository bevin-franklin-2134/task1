import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/events/get_result_event.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';
import 'package:task1/helpers/utils.dart';

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
                    buildCard(
                        title: "Bounds",
                        value: getPrettyJSONString(
                            (state.resultModel?.routes ?? []).first.bounds!),context: context),
                    buildCard(
                        title: "Legs",
                        value: getPrettyJSONString(
                            (state.resultModel?.routes ?? []).first.legs!.first),context: context),
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

  Card buildCard({required String title, required String value,context}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(translate(title)),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height*.8
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: Text(value)),
                ),
              ),
            ),
          ],
        ));
  }
}

String getPrettyJSONString(jsonObject) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}
