import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/green_screen.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const GreenScreen();
          },
        ),
      );

      Timer(const Duration(milliseconds: 500), () => Navigator.pop(context));
    });
    super.initState();
  }
}
