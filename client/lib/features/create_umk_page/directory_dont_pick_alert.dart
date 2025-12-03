import 'package:flutter/material.dart';

class DirectoryDontPickAlert extends StatelessWidget {
  const DirectoryDontPickAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 6,
      child: Padding(
        padding: .all(16.0),
        child: Column(
          mainAxisSize: .min,
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Выберите папку для УМК"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("ОК"),
            ),
          ],
        ),
      ),
    );
  }
}
