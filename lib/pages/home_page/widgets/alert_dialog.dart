import 'package:flutter/material.dart';

class Web3AlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const Web3AlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      content: content,
      actions: actions,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 24.0,
    );
  }
}
