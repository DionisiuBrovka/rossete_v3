import 'package:client/features/start_page/start_page.dart';
import 'package:client/services/umk_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerSingleton<UmkService>(UmkService());
}

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 121, 150, 255),
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.expressive,
        ),
      ),
      home: StartPage(),
    );
  }
}
