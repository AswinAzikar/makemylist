
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/models/todo_model.dart';
import 'package:makemylist/services/database_services.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DatabaseService _databaseService = DatabaseService();

  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    try {
      final todos = await _databaseService.fetchTasks();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to load tasks'));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await _databaseService.insertTask(event.todo);
      add(LoadTodosEvent());
    } catch (e) {
      emit(TodoError('Failed to add task'));
    }
  }

  Future<void> _onDeleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await _databaseService.deleteTask(event.id);
      add(LoadTodosEvent());
    } catch (e) {
      emit(TodoError('Failed to delete task'));
    }
  }
}
