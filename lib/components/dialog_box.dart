// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:classtime_app/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                text: "Save",
                onPressed: onSave,
              ),
              SizedBox(width: 10),
              MyButton(text: "Cancel", onPressed: onCancel),
              const SizedBox(width: 8),
            ],
          ),
        ]),
      ),
    );
  }
}
