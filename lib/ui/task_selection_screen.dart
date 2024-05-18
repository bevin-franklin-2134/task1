import 'package:flutter/material.dart';
import 'package:task1/helpers/nav_helper.dart';
import 'package:task1/widget/button_widget.dart';

class TaskSelectionScreen extends StatelessWidget {
  const TaskSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titledButton("task_1", task_1),
          titledButton("task_2", task_2),
        ],
      ),
    );
  }
}
