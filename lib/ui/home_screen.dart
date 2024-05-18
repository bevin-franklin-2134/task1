import 'package:flutter/material.dart';
import 'package:task1/helpers/ui_helpers.dart';
import 'package:task1/helpers/utils.dart';
import 'package:task1/modal/data.dart';
import 'package:task1/modal/data_model.dart';
import 'package:task1/widget/balance_statics_widget.dart';
import 'package:task1/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel data=DataModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=DataModel.fromJson(customData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height:
                  (thirdScreenWidth(context) *3 / 1.6),
              color: getColorFromHex("3C6CF2"),
            ),
             Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  BalanceStaticsWidget(data: data,),
                  verticalSpaceMedium,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.badgesData?.length??0,
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: MetalCard(data: data.badgesData![index],),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


