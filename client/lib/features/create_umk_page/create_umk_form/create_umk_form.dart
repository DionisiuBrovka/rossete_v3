import 'package:client/features/create_umk_page/create_umk_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateUmkForm extends StatelessWidget {
  const CreateUmkForm({super.key, required this.controller});

  final CreateUmkPageController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: .fromLTRB(16, 20, 16, 90),
      child: Column(
        spacing: 8,
        children: [
          ApiKeyField(controller: controller.apiController),
          DirectoryPicker(controller: controller.directoryController),
          SizedBox(height: 16),
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

class ApiKeyField extends StatelessWidget {
  const ApiKeyField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          label: Text("API-ключ"),
        ),
      ),
    );
  }
}

class KnowledgeField extends StatelessWidget {
  const KnowledgeField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        minLines: 5,
        maxLines: 25,
        decoration: InputDecoration(
          labelText: 'Учащийся должен знать:',
          suffixIcon: Icon(Icons.menu_book),
          floatingLabelAlignment: .start,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}

class SkillsField extends StatelessWidget {
  const SkillsField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        minLines: 5,
        maxLines: 25,
        decoration: InputDecoration(
          labelText: 'Учащийся должен уметь:',
          suffixIcon: Icon(Icons.school),
          floatingLabelAlignment: .start,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}

class DescField extends StatelessWidget {
  const DescField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        minLines: 5,
        maxLines: 25,
        decoration: InputDecoration(
          labelText: 'Описание предмета',
          suffixIcon: Icon(Icons.description),
          floatingLabelAlignment: .start,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Полное название предмета',
          suffixIcon: Icon(Icons.title),
        ),
      ),
    );
  }
}

class ShortNameField extends StatelessWidget {
  const ShortNameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Краткое название предмета',
          suffixIcon: Icon(Icons.text_fields),
        ),
      ),
    );
  }
}

class SpecialityNameField extends StatelessWidget {
  const SpecialityNameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Код специальности с названием',
          suffixIcon: Icon(Icons.group),
        ),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: .circular(12),
      ),
      child: Padding(
        padding: .all(9.0),
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
