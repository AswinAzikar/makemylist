part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;

  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  DeleteTodoEvent(this.id);
}

class MarkTaskAsCompletedEvent extends TodoEvent {
  final int id;

  MarkTaskAsCompletedEvent(this.id);
}

class DeleteCompletedTodoEvent extends TodoEvent {
  final int id;

  DeleteCompletedTodoEvent(this.id);
}
