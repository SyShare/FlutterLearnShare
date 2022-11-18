import 'package:flutter/material.dart';

import '../../../app/bloc_provider.dart';
import '../../../calendar_app_repository.dart';
import '../../../widgets/list_items/todo_list_tile.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).todoListBloc;
    return StreamBuilder(
      stream: bloc.todos,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            Task todo = snapshot.data[index];
            return TodoListTile(
              task: todo,
              onCheckboxToggle: (v) => bloc.toggleTaskComplete(todo),
              onRefreshed: () => bloc.refreshTaskDate(todo),
            );
          },
        );
      },
    );
  }
}
