import 'package:flutter/material.dart';
import 'package:flutter_one/screens/todo_list_screen/widgets/todo_list.dart';

import '../../app/bloc_provider.dart';
import '../../calendar_app_repository.dart';
import '../../widgets/calendar/calendar.dart';
import '../screen_container.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).todoListBloc;
    return ScreenContainer(
      title: Text('Active Todos'),
      body: StreamBuilder<DateTime>(
          stream: bloc.selectedDate,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Calendar(
                      weeklyDates: Week().dates,
                      selectedDate: snapshot.hasData ? snapshot.data : null,
                      onDateSelected: (DateTime d) {
                        bloc.selectedDateControllerSink.add(d);
                      },
                    ),
                  ),
                ),
                Expanded(child: TodoList()),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/add");
        },
      ),
    );
  }
}
