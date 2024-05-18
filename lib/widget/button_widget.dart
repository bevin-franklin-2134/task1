import 'package:flutter/material.dart';
import 'package:task1/helpers/nav_helper.dart';

import '../helpers/utils.dart';

Widget titledButton(String label,String route) {
  return Center(
    child: InkWell(
      onTap: () => openScreen(route),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle
        ),
        child: Text(
          translate(label),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}