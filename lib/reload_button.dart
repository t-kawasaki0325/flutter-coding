import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/error_dialog.dart';
import 'package:flutter_training/main.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final notifier = ref.read(weatherStateProvider.notifier);
      void reload() {
        try {
          notifier.update();
        } catch (_) {
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return ErrorDialog();
            },
          );
        }
      }

      return TextButton(
        onPressed: reload,
        child: Text(
          'Reload',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.blue),
        ),
      );
    });
  }
}
