
import 'package:flutter/material.dart';
import 'package:flutter_one/screens/add_todo_screen/widgets/body_container.dart';

import '../../app/bloc_provider.dart';
import '../../calendar_app_repository.dart';
import '../screen_container.dart';

class AddAndEditTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).editTodoBloc;
    return StreamBuilder<Task>(
      stream: bloc.todo,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return ScreenContainer(
          title: Text('Add Todo'),
          body: FormContainer(),
          floatingActionButton: FloatingActionButton.extended(
            label: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Save'),
            ),
            onPressed: () {
              BlocProvider.of(context).todoListBloc.addTask(bloc.todo.value);
              bloc.clearAddEditForm();
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
