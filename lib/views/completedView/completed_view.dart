import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/extensions/extensions.dart';
import 'package:makemylist/models/todo_model.dart';
import 'package:makemylist/utils/constants.dart';
import 'package:makemylist/utils/size_utils.dart';
import 'package:makemylist/widgets/dismissible_widget/dismiss_background.dart';

class CompletedView extends StatelessWidget {
  CompletedView({super.key});

  final containerHeight = SizeUtils.height * .15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoaded) {
            return FutureBuilder<List<TodoModel>>(
              future: context
                  .read<TodoBloc>()
                  .databaseService
                  .fetchCompletedTasks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No completed tasks.'));
                } else {
                  final completedTodos = snapshot.data!;
                  return ListView.builder(
                    itemCount: completedTodos.length,
                    itemBuilder: (context, index) {
                      final todo = completedTodos[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding, vertical: padding),
                        child: Dismissible(
                          behavior: HitTestBehavior.translucent,
                          key: Key(todo.id.toString()),
                          direction: DismissDirection.horizontal,
                          background: DismissBackground(
                            alignment: Alignment.centerLeft,
                            icon: LucideIcons.checkCircle,
                          ),
                          secondaryBackground: DismissBackground(
                            alignment: Alignment.centerRight,
                            icon: LucideIcons.delete,
                          ),
                          onDismissed: (direction) {
                            context
                                .read<TodoBloc>()
                                .add(DeleteCompletedTodoEvent(todo.id!));
                          },
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: paddingXL.h,
                                    vertical: SizeUtils.height * 0.3,
                                  ),
                                  child: Container(
                                    height: SizeUtils.height * 0.35,
                                    width: SizeUtils.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(paddingLarge.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: paddingXL * 2.h,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  paddingLarge.h),
                                              topRight: Radius.circular(
                                                  paddingLarge.h),
                                            ),
                                            color: primaryColor,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                todo.title,
                                                style: context.robotoBold20
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: paddingLarge),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(todo.description),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: padding, horizontal: paddingLarge),
                              width: double.maxFinite,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                boxShadow: constShadow,
                                borderRadius:
                                    BorderRadius.circular(paddingLarge),
                                color: primaryColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: SizeUtils.width / 1.4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            todo.title,
                                            style: context.robotoBold18
                                                .copyWith(
                                                    fontSize: 20.fSize,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          todo.description,
                                          style: context.robotoItalic18
                                              .copyWith(
                                                  fontSize: 18.fSize,
                                                  color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
