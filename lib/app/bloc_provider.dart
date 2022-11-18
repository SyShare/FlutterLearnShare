import 'package:flutter/material.dart';

import 'blocs/edit_todo_bloc.dart';
import 'blocs/todos_bloc.dart';

class BlocProvider extends InheritedWidget {
  final TodoListBloc todoListBloc;
  final EditTodoBloc editTodoBloc;

  const BlocProvider({
    Key? key,
    required Widget child,
    required this.todoListBloc,
    required this.editTodoBloc,
  })  : super(key: key, child: child);

  static BlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>()!;
  }

  @override
  bool updateShouldNotify(BlocProvider old) {
    return true;
  }
}
