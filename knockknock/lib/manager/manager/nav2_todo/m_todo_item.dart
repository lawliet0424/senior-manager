import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';

class TodoItem extends StatefulWidget {
  final String text;
  final Function(String) onEdit;
  final VoidCallback onDelete;

  const TodoItem({
    Key? key,
    required this.text,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late TextEditingController editController;
  bool _isEditing = false;
  bool _isDone = false; // 추가된 부분

  @override
  void initState() {
    super.initState();
    editController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: _isDone,
          onChanged: (bool? value) {
            setState(() {
              _isDone = value!;
            });
          },
        ),
        _isEditing
            ? Expanded(
                child: TextField(
                  controller: editController,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  onSubmitted: (value) {
                    widget.onEdit(editController.text);
                    setState(() {
                      _isEditing = false;
                    });
                  },
                ),
              )
            : Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    child: SizedBox(
                      width: 290,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: 22,
                          decoration: _isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onDelete,
                    icon: const Icon(Icons.delete),
                    iconSize: 25,
                    padding: const EdgeInsets.all(0),
                    color: MyColor.myMediumGrey,
                  ),
                ],
              ),
      ],
    );
  }
}
