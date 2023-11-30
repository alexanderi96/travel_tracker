import 'package:flutter/material.dart';

enum MessageType {
  error,
  warning,
  info,
}

class MessageDialog extends StatelessWidget {
  final String title;
  final String message;
  final MessageType type;

  MessageDialog({
    required this.title,
    required this.message,
    required this.type,
  });

  IconData _getIcon() {
    switch (type) {
      case MessageType.error:
        return Icons.error;
      case MessageType.warning:
        return Icons.warning;
      case MessageType.info:
        return Icons.info;
    }
  }

  Color _getColor() {
    switch (type) {
      case MessageType.error:
        return Colors.red;
      case MessageType.warning:
        return Colors.amber;
      case MessageType.info:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(_getIcon(), color: _getColor()),
          SizedBox(width: 10),
          Text(title),
        ],
      ),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
