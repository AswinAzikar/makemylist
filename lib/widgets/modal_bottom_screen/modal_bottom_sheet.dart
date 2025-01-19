import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/extensions/extensions.dart';
import 'package:makemylist/models/todo_model.dart';
import 'package:makemylist/utils/constants.dart';
import 'package:makemylist/utils/size_utils.dart';
import 'package:makemylist/widgets/buttons/common_button.dart';

class ModalBottomSheet {
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.8.h,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              right: 16.h,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
              top: 16.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                gapLarge,
                TextField(
                  maxLines: 7,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add description"),
                      ],
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                gapLarge,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: paddingXL * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButton(
                        backgroundColor: Colors.red,
                        onTap: () {
                          Navigator.pop(context);
                          titleController.clear();
                          descriptionController.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingLarge, vertical: padding),
                          child: Text(
                            "Cancel",
                            style: context.robotoRegular16.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.fSize,
                            ),
                          ),
                        ),
                      ),
                      CommonButton(
                        backgroundColor: Colors.green,
                        onTap: () {
                          final title = titleController.text.trim();
                          final description = descriptionController.text.trim();
                          if (title.isNotEmpty && description.isNotEmpty) {
                            context.read<TodoBloc>().add(
                                  AddTodoEvent(
                                    TodoModel(
                                      title: title,
                                      description: description,
                                    ),
                                  ),
                                );
                            Navigator.pop(context);
                            titleController.clear();
                            descriptionController.clear();
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill in all fields!'),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingLarge, vertical: padding),
                          child: Text(
                            'Save',
                            style: context.robotoRegular.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.fSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
