import 'package:client/features/create_umk_page/create_umk_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: StartPageMenu()));
  }
}

class StartPageMenu extends StatelessWidget {
  const StartPageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        const _TitleText(),
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateUmkPage()),
            );
          },
          icon: Icon(Icons.create),
          label: Text("Создать УМК"),
        ),
        TextButton.icon(
          onPressed: null,
          icon: Icon(Icons.upload),
          label: Text("Загрузить УМК"),
        ),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text('Rossete', style: Theme.of(context).textTheme.headlineMedium),
        Text(
          'v3.0',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontStyle: FontStyle.italic,
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withAlpha(100),
          ),
        ),
      ],
    );
  }
}
