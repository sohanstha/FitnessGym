import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Model class for the to-do item
class Exercise1 {
  final int id;
  final String title;
  final String description;

  Exercise1({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Exercise1.fromMap(Map<String, dynamic> map) {
    return Exercise1(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise1.fromJson(String source) =>
      Exercise1.fromMap(json.decode(source));
}

// Main app widget
class ExerciseApp extends StatefulWidget {
  @override
  _ExerciseAppState createState() => _ExerciseAppState();
}

class _ExerciseAppState extends State<ExerciseApp> {
  List<Exercise1> _todos = [];
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
    List<String> todoList = _prefs.getStringList('todos1') ?? [];
    setState(() {
      _todos = todoList.map((todo) => Exercise1.fromJson(todo)).toList();
    });
  }

  void _saveTodos() {
    List<String> todoList = _todos.map((todo) => todo.toJson()).toList();
    _prefs.setStringList('todos1', todoList);
  }

  void _addTodo() {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    if (title.isNotEmpty && description.isNotEmpty) {
      Exercise1 todo = Exercise1(
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
        home: Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Color(0xFF92A3FD),
              title: Text('Custom Exercise'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
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
            )));
  }
}

void main() {
  runApp(ExerciseApp());
}
