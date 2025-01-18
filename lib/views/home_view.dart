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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding),
                  child: Dismissible(
                    behavior: HitTestBehavior.translucent,
                    key: Key(todo.id.toString()),
                    direction: DismissDirection.horizontal,
                    background: dismissBackground(
                      alignment: Alignment.centerLeft,
                      icon: LucideIcons.delete,
                    ),
                    secondaryBackground: dismissBackground(
                      alignment: Alignment.centerRight,
                      icon: LucideIcons.delete,
                    ),
                    onDismissed: (direction) {
                      context.read<TodoBloc>().add(DeleteTodoEvent(todo.id!));
                    },
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding.h,
                                vertical: SizeUtils.height * 0.25),
                            child: Container(
                              padding: EdgeInsets.all(paddingLarge),
                              height: SizeUtils.height * 0.2,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(paddingLarge.h)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(todo.title)],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: containerHeight,
                        decoration: BoxDecoration(
                          boxShadow: constShadow,
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

  Widget dismissBackground({
    required Alignment alignment,
    required IconData icon,
  }) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(paddingLarge),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
