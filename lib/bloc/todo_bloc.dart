import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/models/todo_model.dart';
import 'package:makemylist/services/database_services.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DatabaseService databaseService = DatabaseService();

  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<MarkTaskAsCompletedEvent>(_onMarkTaskAsCompleted);
    on<DeleteCompletedTodoEvent>(_onDeleteCompletedTodo);
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    try {
      final todos = await databaseService.fetchTasks();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to load tasks'));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseService.insertTask(event.todo);
      add(LoadTodosEvent());
    } catch (e) {
      emit(TodoError('Failed to add task'));
    }
  }

  Future<void> _onDeleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseService.deleteTask(event.id);
      add(LoadTodosEvent());
    } catch (e) {
      emit(TodoError('Failed to delete task'));
    }
  }

  Future<void> _onMarkTaskAsCompleted(
      MarkTaskAsCompletedEvent event, Emitter<TodoState> emit) async {
    try {
      TodoModel task = await databaseService.fetchTaskById(event.id);

      await databaseService.insertCompletedTask(task);

      await databaseService.deleteTask(event.id);

      add(LoadTodosEvent());
    } catch (e) {
      log("Error marking task as completed: $e");

      emit(TodoError('Failed to mark task as completed'));
    }
  }

  Future<void> _onDeleteCompletedTodo(
      DeleteCompletedTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await databaseService.deleteTask(event.id);
      add(LoadTodosEvent());
    } catch (e) {
      emit(TodoError('Failed to delete completed task'));
    }
  }
}
