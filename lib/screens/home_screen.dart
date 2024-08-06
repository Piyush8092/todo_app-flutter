import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodo() {
    if (_textController.text.isEmpty) return;

    setState(() {
      _todos.add(Todo(
        title: _textController.text,
      ));
    });
    _textController.clear();
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    todo: _todos[index],
                    onToggle: () => _toggleTodoStatus(index),
                    onRemove: () => _removeTodo(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
