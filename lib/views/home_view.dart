import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/utils/constants.dart';
import 'package:makemylist/utils/size_utils.dart';

import 'package:makemylist/widgets/modal_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final containerHeight = SizeUtils.height * .1;
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
                  behavior: HitTestBehavior.opaque,
                  crossAxisEndOffset: 1,
                  key: Key(todo.id.toString()),
                  background: Container(
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    height: containerHeight,
                  ),
                  onDismissed: (direction) {
                  
                    context.read<TodoBloc>().add(DeleteTodoEvent(todo.id!));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Container(
                      height: containerHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 0, // How much the shadow spreads
                            blurRadius: 5, // Blur radius
                            offset:
                                Offset(0, 3), // Vertical offset for elevation
                          ),
                        ],
                        borderRadius: BorderRadius.circular(paddingLarge),
                        color: Colors.amber,
                      ),
                      child: ListTile(
                        title: Text(todo.title),
                        subtitle: Text(
                          todo.description,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
        child: Icon(LucideIcons.pencil),
      ),
    );
  }
}
