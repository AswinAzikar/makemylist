import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/models/todo_model.dart';

class ModalBottomSheet {
  static void show(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Ensures the keyboard doesn't overlap the modal
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                16.0, // Adjust for keyboard
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final title = _titleController.text;
                      final description = _descriptionController.text;
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in all fields!'),
                          ),
                        );
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
