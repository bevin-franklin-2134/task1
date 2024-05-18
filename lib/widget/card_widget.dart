import 'package:flutter/material.dart';
import 'package:task1/helpers/utils.dart';
import 'package:task1/modal/data_model.dart';
import 'package:task1/widget/common_widget.dart';

class MetalCard extends StatelessWidget {
  const MetalCard({super.key, required this.data});
final BadgesData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:getColorFromHex(data.iconColor??"000000"),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child:  Icon(Icons.bar_chart_outlined,  color:getColorFromHex(data.titleColor??"000000"),),
                    ),
                    const SizedBox(width: 12),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.badgeTitle??"",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color:getColorFromHex(data.titleColor??"000000"),)),
                        Text(data.badgeHertz??"",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(formatUSCurrency(data.badgeBalance?.toDouble()??0),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(data.badgeStatus??"",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(height: 5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBalanceRow(context, translate("metal_price"),
                    formatUSCurrency(data.metalPrice?.toDouble()??0), TextAlign.left,
                    textTitleColor: Colors.black, textValueColor: Colors.black,fontWeight: FontWeight.w400),
                buildBalanceRow(context, translate("change"),
                    data.change??"", TextAlign.right,
                    textValueColor: getColorFromHex("B8705D"), textTitleColor: Colors.black,fontSize: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
