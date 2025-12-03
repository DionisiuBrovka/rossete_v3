import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessStateWidget extends StatelessWidget {
  const ProcessStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 475,
            child: Column(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              spacing: 8,
              children: [
                Text(
                  " Создание файлов УМК",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 275,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        ProcessStatusItem(
                          label: "создание мета-данных (.rossete)",
                          status: .success,
                        ),
                        ProcessStatusItem(
                          label: "создание хранилища (.obsidian)",
                          status: .error,
                        ),
                        ProcessStatusItem(
                          label: "создание базовых папок",
                          status: .procces,
                        ),
                        ProcessStatusItem(
                          label: "загрузка шаблонных документов",
                          status: .none,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ProcessStatusItemStatus { none, procces, success, error }

class ProcessStatusItem extends StatelessWidget {
  const ProcessStatusItem({
    super.key,
    required this.label,
    this.status = .none,
  });

  final String label;
  final ProcessStatusItemStatus status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          Text(label, style: GoogleFonts.ibmPlexMono(fontSize: 14, height: 0)),
          Spacer(),
          switch (status) {
            .none => Center(),
            .procces => SpinKitPulse(color: Colors.white, size: 24),
            .success => Icon(Icons.check, color: Colors.greenAccent),
            .error => Icon(Icons.close, color: Colors.redAccent),
          },
        ],
      ),
    );
  }
}
