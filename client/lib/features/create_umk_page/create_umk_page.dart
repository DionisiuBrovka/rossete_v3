import 'package:client/features/create_umk_page/create_umk_form/create_umk_form.dart';
import 'package:flutter/material.dart';

class CreateUmkPageController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();
  TextEditingController specialityNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController knowledgeController = TextEditingController();
  TextEditingController directoryController = TextEditingController();
  TextEditingController ktpFileController = TextEditingController();

  void onCreateButtonPressed() {}

  @override
  void dispose() {
    nameController.dispose();
    shortNameController.dispose();
    specialityNameController.dispose();
    descController.dispose();
    skillsController.dispose();
    knowledgeController.dispose();
    directoryController.dispose();
    ktpFileController.dispose();
    super.dispose();
  }
}

class CreateUmkPage extends StatefulWidget {
  const CreateUmkPage({super.key});

  @override
  State<CreateUmkPage> createState() => _CreateUmkPageState();
}

class _CreateUmkPageState extends State<CreateUmkPage> {
  late final CreateUmkPageController controller;

  @override
  void initState() {
    controller = CreateUmkPageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Создать УМК'), elevation: 2),
      body: Align(
        alignment: Alignment.topCenter,
        child: CreateUmkForm(controller: controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onCreateButtonPressed,
        child: Icon(Icons.check),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
