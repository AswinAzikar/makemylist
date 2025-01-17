import 'package:flutter/material.dart';
import 'package:makemylist/viewmodels/todo_view_model.dart';
import 'package:makemylist/widgets/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do App')),
      body: Consumer<TodoViewModel>(
        builder: (context, viewModel, child) {
          final todos = viewModel.todos;
          if (todos.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Dismissible(
                key: Key(todo.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  viewModel.deleteTodo(todo.id!);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${todo.title} dismissed'),
                  ));
                },
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => ModalBottomSheet(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
