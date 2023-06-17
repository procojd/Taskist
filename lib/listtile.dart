import 'package:flutter/material.dart';

class listTile extends StatelessWidget {
  final bool ischecked;
  final String tasktitle;
  final Function checkboxtoggle;

  listTile(this.ischecked, this.tasktitle, this.checkboxtoggle);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          tasktitle,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: ischecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          shape: CircleBorder(),
          value: ischecked,
          onChanged: (newvalue) {
            checkboxtoggle(newvalue);
          },
        ));
  }
}
