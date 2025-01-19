part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodosLoaded extends TodoState {
  final List<TodoModel> todos;

  TodosLoaded(this.todos);
}

class CompletedTodosLoaded extends TodoState {
  final List<TodoModel> completedTodos;

  CompletedTodosLoaded(this.completedTodos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}
