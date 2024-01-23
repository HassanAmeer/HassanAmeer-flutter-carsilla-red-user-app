import 'package:flutter/material.dart';

showtoastF(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg.toString()),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    ),
  );
}
