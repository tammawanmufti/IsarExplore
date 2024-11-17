import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key, required this.title});

  final String title;

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
      ),
      actions: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .pop(_controller.text.isNotEmpty ? _controller.text : null);
            },
            label: const Text('save'))
      ],
    );
  }
}
