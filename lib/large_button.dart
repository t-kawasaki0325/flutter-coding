import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String label;
  final Function action;
  const LargeButton({Key? key, required this.label, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => action,
      child: Text(label,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.blue)),
    );
  }
}
