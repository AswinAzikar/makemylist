part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
class TodosLoaded extends TodoState {
  final List<TodoModel> todos;
  TodosLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
