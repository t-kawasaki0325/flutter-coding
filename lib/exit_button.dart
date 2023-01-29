import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  void close() {
    Platform.isIOS ? exit(0) : SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: close,
      child: Text(
        'Close',
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.blue),
      ),
    );
  }
}
