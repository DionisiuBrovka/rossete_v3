import 'package:client/features/create_umk_page/create_umk_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateUmkForm extends StatelessWidget {
  const CreateUmkForm({super.key, required this.controller});

  final CreateUmkPageController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          DirectoryPicker(controller: controller.directoryController),
          KtpFilePicker(controller: controller.ktpFileController),
          NameField(controller: controller.nameController),
          ShortNameField(controller: controller.shortNameController),
          SpecialityNameField(controller: controller.specialityNameController),
          DescField(controller: controller.descController),
          SkillsField(controller: controller.skillsController),
          KnowledgeField(controller: controller.knowledgeController),
        ],
      ),
    );
  }
}

class KnowledgeField extends StatelessWidget {
  const KnowledgeField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 5,
      maxLines: 25,
      decoration: InputDecoration(
        labelText: 'Учащийся должен знать:',
        suffixIcon: Icon(Icons.menu_book),
        floatingLabelAlignment: .start,
        alignLabelWithHint: true,
      ),
    );
  }
}

class SkillsField extends StatelessWidget {
  const SkillsField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 5,
      maxLines: 25,
      decoration: InputDecoration(
        labelText: 'Учащийся должен уметь:',
        suffixIcon: Icon(Icons.school),
        floatingLabelAlignment: .start,
        alignLabelWithHint: true,
      ),
    );
  }
}

class DescField extends StatelessWidget {
  const DescField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 5,
      maxLines: 25,
      decoration: InputDecoration(
        labelText: 'Описание предмета',
        suffixIcon: Icon(Icons.description),
        floatingLabelAlignment: .start,
        alignLabelWithHint: true,
      ),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Полное название предмета',
        suffixIcon: Icon(Icons.title),
      ),
    );
  }
}

class ShortNameField extends StatelessWidget {
  const ShortNameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Краткое название предмета',
        suffixIcon: Icon(Icons.text_fields),
      ),
    );
  }
}

class SpecialityNameField extends StatelessWidget {
  const SpecialityNameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Код специальности с названием',
        suffixIcon: Icon(Icons.group),
      ),
    );
  }
}

class DirectoryPicker extends StatefulWidget {
  const DirectoryPicker({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<DirectoryPicker> createState() => _DirectoryPickerState();
}

class _DirectoryPickerState extends State<DirectoryPicker> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: .all(0),
      child: Padding(
        padding: .all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.controller.text.isEmpty
                    ? 'Выберите директорию для создания УМК'
                    : widget.controller.text,
              ),
            ),
            FilledButton.icon(
              onPressed: () async {
                String? selectedDirectory = await FilePicker.platform
                    .getDirectoryPath();

                if (selectedDirectory != null) {
                  widget.controller.text = selectedDirectory;
                }

                if (selectedDirectory == null) {
                  widget.controller.text = '';
                }
              },
              label: Text("выбрать"),
              icon: Icon(Icons.folder_open),
            ),
          ],
        ),
      ),
    );
  }
}

class KtpFilePicker extends StatefulWidget {
  const KtpFilePicker({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<KtpFilePicker> createState() => _KtpFilePickerState();
}

class _KtpFilePickerState extends State<KtpFilePicker> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: .all(0),
      child: Padding(
        padding: const .all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.controller.text.isEmpty
                    ? 'Выберите файл таблицы КТП'
                    : widget.controller.text,
              ),
            ),
            FilledButton.icon(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: .custom,
                  allowedExtensions: ['xlsx', 'xls'],
                );

                if (result != null && result.files.isNotEmpty) {
                  widget.controller.text = result.files.single.path ?? '';
                }

                if (result == null) {
                  widget.controller.text = '';
                }
              },
              label: Text("выбрать"),
              icon: Icon(Icons.folder_open),
            ),
          ],
        ),
      ),
    );
  }
}
