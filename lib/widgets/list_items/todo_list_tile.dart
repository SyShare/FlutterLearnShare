import 'package:flutter/material.dart';

import '../../calendar_app_repository.dart';
import '../../utils/humanize_values.dart';

class TodoListTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onCheckboxToggle;
  final VoidCallback onRefreshed;

  TodoListTile({
    Key? key,
    required this.task,
    required this.onCheckboxToggle,
    required this.onRefreshed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tile;

    if (task.isRepeating) {
      tile = ListTile(
        title: Text(task.description?? ""),
        subtitle: Text(
          "Due every${Humanize.listOfDays(
            task.repeatingDays?.map((DayOfWeek e) => e.toString()).toList(),
          )}",
        ),
        trailing: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: onRefreshed,
        ),
      );
    } else {
      tile = CheckboxListTile(
        value: task.complete,
        title: Text(task.description ?? ""),
        subtitle: task.dueDate != null ? Text(Humanize.dateTime(task.dueDate)) : Container(),
        onChanged: onCheckboxToggle,
      );
    }

    return tile;
  }
}
