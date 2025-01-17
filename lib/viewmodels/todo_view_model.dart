import 'package:flutter/material.dart';
import 'package:makemylist/services/database_services.dart';
import '../models/todo_model.dart';


class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  final DatabaseService _databaseService = DatabaseService();

  Future<void> loadTodos() async {
    _todos = await _databaseService.fetchTasks();
    notifyListeners();
  }

  Future<void> addTodo(String title, String description) async {
    await _databaseService
        .insertTask(TodoModel(title: title, description: description));
    await loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _databaseService.deleteTask(id);
    await loadTodos();
  }
}
