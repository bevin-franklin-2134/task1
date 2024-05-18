// A helper method to create the text widgets
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:task1/helpers/ui_helpers.dart';
import 'package:task1/helpers/utils.dart';

Widget buildBalanceText(
    String amount, String description, TextAlign textAlign,
    {bool? isPercentageWidget = false,Color? textTitleColor,Color? textValueColor,}) {
  return Column(
    crossAxisAlignment: textAlign == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end,
    children: [
      isPercentageWidget == true
          ? containerTextWidget(amount)
          : Text(
        amount,
        style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color:textValueColor?? Colors.white),
      ),
      verticalSpace(6),
      Text(
        description,
        style:  TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: textTitleColor??Colors.white),
      )
    ],
  );
}

Container containerTextWidget(String amount) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20)),
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          amount,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Icon(
          Icons.arrow_drop_up_outlined,
          color: Colors.green,
        )
      ],
    ),
  );
}

// A helper method to create the balance row
Widget buildBalanceRow(BuildContext context, String description,
    String amount, TextAlign textAlign,
    {Widget? trailingIcon,Color? textTitleColor,Color? textValueColor,double? fontSize,FontWeight?fontWeight}) {
  return Column(
    crossAxisAlignment: textAlign == TextAlign.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end,
    children: [
      Text(
        description,
        style:  TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: textTitleColor??Colors.white),
      ),
      verticalSpace(6),
      Row(
        children: [
          Text(
            amount,
            style:  TextStyle(
                fontSize: fontSize??24,
                fontWeight: fontWeight??FontWeight.bold,
                color:textValueColor?? Colors.white),
          ),
          horizontalSpaceTiny,
          if (trailingIcon != null) trailingIcon,
        ],
      ),
    ],
  );
}