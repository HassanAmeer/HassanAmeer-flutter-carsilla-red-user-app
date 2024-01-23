import 'package:flutter/cupertino.dart';

underWorkAlert(context) async {
  await showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Previous Screens Hidden'),
        content: const Text(
            'Next Screens is Visible when MVVM Structure is Finished'),
        actions: [
          CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
          // You can add more buttons here if needed
        ],
        insetAnimationCurve: Curves.slowMiddle,
        insetAnimationDuration: const Duration(seconds: 2),
      );
    },
  );
}
