part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}
class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;
  DeleteTodoEvent(this.id);
}
