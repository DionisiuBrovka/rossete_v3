import 'package:client/features/create_umk_page/create_umk_form/create_umk_form.dart';
import 'package:client/features/create_umk_page/create_umk_page.dart';
import 'package:flutter/material.dart';

class InitStateWidget extends StatelessWidget {
  const InitStateWidget({super.key, required this.controller});

  final CreateUmkPageController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .topCenter,
      child: SizedBox(width: 777, child: CreateUmkForm(controller: controller)),
    );
  }
}
