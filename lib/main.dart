import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/util/api.dart';
import 'package:flutter_one/screens/add_todo_screen/add_todo_screens.dart';
import 'package:flutter_one/screens/todo_list_screen/todo_list_screen.dart';

import 'app/bloc_provider.dart';
import 'app/blocs/edit_todo_bloc.dart';
import 'app/blocs/todos_bloc.dart';
import 'calendar_app_repository.dart';

void main11() {
  var _repository = TodoRepository(WebClient());

  runApp(
    BlocProvider(
      todoListBloc: TodoListBloc(_repository),
      editTodoBloc: EditTodoBloc(seed: Task('')),
      child: BlocsWithoutLibrariesApp(),
    ),
  );
}

class MainStateFul extends StatefulWidget {
  const MainStateFul({Key? key}) : super(key: key);

  @override
  State<MainStateFul> createState() => _MainStateFulState();
}

class _MainStateFulState extends State<MainStateFul> {
  String? httpData;

  Api api = Api();

  void fetchData() {
    api.getCategory(Api.popular).then((value) => {
    setState(() {
      httpData = value.toJson().toString();
    })
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Text(
        '$httpData',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class BlocsWithoutLibrariesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => MainStateFul(),
        '/add': (BuildContext context) => AddAndEditTodoScreen(),
      },
    );
  }
}

