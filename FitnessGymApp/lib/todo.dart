import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  final int id;
  final String title;
  final String description;

  Todo({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}

// Main app widget
class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> _todos = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    _prefs = await SharedPreferences.getInstance();
    List<String> todoList = _prefs.getStringList('todos') ?? [];
    setState(() {
      _todos = todoList.map((todo) => Todo.fromJson(todo)).toList();
    });
  }

  void _saveTodos() {
    List<String> todoList = _todos.map((todo) => todo.toJson()).toList();
    _prefs.setStringList('todos', todoList);
  }

  void _addTodo() {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    if (title.isNotEmpty && description.isNotEmpty) {
      Todo todo = Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: title,
        description: description,
      );
      setState(() {
        _todos.add(todo);
        _saveTodos();
        _titleController.clear();
        _descriptionController.clear();
      });
    }
  }

  void _deleteTodo(int id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
      _saveTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Scaffold(
              appBar: AppBar(
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Color(0xFF92A3FD),
                title: Text("Your Today's Meal"),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Meal',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _addTodo,
                    child: Text('Save'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF92A3FD)),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todo = _todos[index];
                        return ListTile(
                          title: Text(todo.title),
                          subtitle: Text(todo.description),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteTodo(todo.id),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ));
  }
}

void main() {
  runApp(TodoApp());
}
