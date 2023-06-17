import 'package:flutter/material.dart';
import 'package:stateman/listtile.dart';
import 'package:stateman/model.dart';

class tasklist extends StatefulWidget {
  final List<Task> tasks;
  tasklist(this.tasks);

  @override
  State<tasklist> createState() => _tasklistState();
}

class _tasklistState extends State<tasklist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return listTile(widget.tasks[index].isdone, widget.tasks[index].name,
              (checkboxstate) {
            setState(() {
              widget.tasks[index].toggle();
            });
          });
        },
        itemCount: widget.tasks.length);
  }
}
// ListView(
//       children: [
//         listTile(tasks[0].isdone, tasks[0].name),
//         listTile(tasks[1].isdone, tasks[1].name),
//         listTile(tasks[2].isdone, tasks[2].name),
//         listTile(tasks[3].isdone, tasks[3].name),
//       ],
//     );