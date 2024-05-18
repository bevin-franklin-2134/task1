import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task1/helpers/utils.dart';
import 'package:task1/modal/data_model.dart';
import 'package:task1/widget/common_widget.dart';

class BalanceStaticsWidget extends StatelessWidget {
  const BalanceStaticsWidget({super.key, required this.data});

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBalanceText(formatUSCurrency(data.accountValue ?? 0),
                translate("account_value"), TextAlign.left),
            buildBalanceText(data.lastPurchase ?? "",
                translate("since_last_purchase"), TextAlign.right,
                isPercentageWidget: true),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Divider(height: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBalanceRow(
              context,
              translate("cash_balance"),
              formatUSCurrency(data.cashBalance ?? 0),
              TextAlign.left,
              trailingIcon: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 20,
              ),
            ),
            buildBalanceRow(context, translate( "metal_holdings"),
                formatUSCurrency(data.metalHoldings ?? 0), TextAlign.right),
          ],
        ),
      ],
    );
  }
}
