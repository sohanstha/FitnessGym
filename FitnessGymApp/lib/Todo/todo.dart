import 'package:fitness_gymapp/Todo/widgets/popup_form.dart';
import 'package:flutter/material.dart';

import 'models/todo_manager.dart';
import 'models/todo_model.dart';

class Exercise extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExercisePage(title: 'Simple Todo App'),
    );
  }
}

class ExercisePage extends StatefulWidget {
  ExercisePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  TodoManager myTodoManager = new TodoManager();

  void _addTodo(Todo todo) {
    setState(() {
      myTodoManager.addTodoTask(todo);
    });
  }

  void _toggleStatus(int index) {
    setState(() {
      myTodoManager.markStatus(index: index);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      myTodoManager.removeTodoTask(id: myTodoManager.todoTasks[index].id);
    });
  }

  Icon _getCheckboxIcon(int index) {
    return myTodoManager.todoTasks[index].status
        ? Icon(
            Icons.check_box_outlined,
            size: 20.0,
            color: Colors.green[400],
          )
        : Icon(
            Icons.check_box_outline_blank,
            size: 20.0,
            color: Colors.green[400],
          );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
              itemCount: myTodoManager.todoTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  key: UniqueKey(),
                  child: ListTile(
                    title: Text(
                      myTodoManager.todoTasks[index].title,
                      style: myTodoManager.todoTasks[index].status
                          ? TextStyle(decoration: TextDecoration.lineThrough)
                          : TextStyle(decoration: TextDecoration.none),
                    ),
                    subtitle: Text(myTodoManager.todoTasks[index].description,
                        style: myTodoManager.todoTasks[index].status
                            ? TextStyle(decoration: TextDecoration.lineThrough)
                            : TextStyle(decoration: TextDecoration.none)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: _getCheckboxIcon(index),
                          onPressed: () {
                            _toggleStatus(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            size: 20.0,
                            color: Colors.green[400],
                          ),
                          onPressed: () {
                            _removeTodo(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
          floatingActionButton: PopupForm(callback: _addTodo)),
    );
  }
}
