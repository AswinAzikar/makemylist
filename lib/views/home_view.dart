import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/bloc/todo_bloc.dart';

import 'package:makemylist/widgets/modal_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do App')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return Dismissible(
                  key: Key(todo.id.toString()),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    context.read<TodoBloc>().add(DeleteTodoEvent(todo.id!));
                  },
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ModalBottomSheet.show(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
