import 'dart:io';

class UmkModel {
  String uuid;
  String basePath;
  String? fullName;
  String? shortName;

  UmkModel({
    required this.uuid,
    required this.basePath,
    this.fullName,
    this.shortName,
  });

  factory UmkModel.fromJson(Map<String, dynamic> json) {
    return UmkModel(
      uuid: json['uuid'] as String,
      fullName: json['full_name'] as String,
      shortName: json['short_name'] as String,
      basePath: json['base_path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'full_name': fullName,
      'short_name': shortName,
      'base_path': basePath,
    };
  }

  void create() {
    // Создание папки .rossete
    Directory rosseteDir = Directory('$basePath/.rossete');
    if (!rosseteDir.existsSync()) {
      rosseteDir.createSync(recursive: true);
    }
  }
}
