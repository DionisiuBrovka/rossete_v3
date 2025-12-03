import 'package:client/features/create_umk_page/create_umk_form/create_umk_form.dart';
import 'package:client/features/create_umk_page/directory_dont_pick_alert.dart';
import 'package:client/features/create_umk_page/init_state_widget.dart';
import 'package:client/features/create_umk_page/process_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum CreateUmkPageState { init, proccessing }

class CreateUmkPageController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController apiKeyController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();
  TextEditingController specialityNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController knowledgeController = TextEditingController();
  TextEditingController directoryController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  ValueNotifier<CreateUmkPageState> state = ValueNotifier(.init);

  void onCreateButtonPressed() {
    if (directoryController.text.isEmpty) {
      final navigatorKey = GetIt.I<GlobalKey<NavigatorState>>();
      showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) {
          return DirectoryDontPickAlert();
        },
      );

      return;
    }

    if (!globalFormKey.currentState!.validate()) {
      return;
    }

    state.value = .proccessing;
  }

  @override
  void dispose() {
    apiKeyController.dispose();
    nameController.dispose();
    shortNameController.dispose();
    specialityNameController.dispose();
    descController.dispose();
    skillsController.dispose();
    knowledgeController.dispose();
    directoryController.dispose();
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
    return ValueListenableBuilder(
      valueListenable: controller.state,
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Создать УМК'), elevation: 2),
          body: switch (state) {
            .init => InitStateWidget(controller: controller),
            .proccessing => ProcessStateWidget(),
          },
          floatingActionButton: state == .init
              ? FloatingActionButton(
                  onPressed: controller.onCreateButtonPressed,
                  child: Icon(Icons.check),
                )
              : null,
          floatingActionButtonLocation: .centerFloat,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
