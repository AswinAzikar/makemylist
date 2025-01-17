import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemylist/bloc/todo_bloc.dart';
import 'package:makemylist/models/todo_model.dart';

class ModalBottomSheet extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 16),
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
                          AddTodoEvent(TodoModel(
                              title: title, description: description)),
                        );
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
