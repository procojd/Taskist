import 'package:flutter/material.dart';
import 'package:stateman/main.dart';

import 'model.dart';

//add blur effect

class addtasksheet extends StatefulWidget {
  final List<Task> tasks;
  addtasksheet(this.tasks);

  @override
  State<addtasksheet> createState() => _addtasksheetState();
}

class _addtasksheetState extends State<addtasksheet> {
  late String newtasktitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          text(text1: "Add task", size: 25, ft: FontWeight.normal),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (value) =>
                newtasktitle = value, //value from textform to newtask
          ),
          const SizedBox(
            height: 15,
          ),
          FilledButton.icon(
              onPressed: () {
                widget.tasks.add(Task(name: newtasktitle));
                Navigator.pop(context);
              },
              icon: Icon(Icons.add),
              label: text(text1: "add", size: 20, ft: FontWeight.normal))
        ],
      ),
    );
  }
}
