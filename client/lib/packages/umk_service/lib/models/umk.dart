import 'dart:io';

class UMK {
  final Directory umkDirectory;
  final String name;
  final String shortName;
  final String apiKey;

  UMK({
    required this.umkDirectory,
    required this.name,
    required this.shortName,
    required this.apiKey,
  });

  factory UMK.fromJson(Map<String, dynamic> json, Directory umkDirectory) {
    return UMK(
      umkDirectory: umkDirectory,
      name: json['name'] as String,
      shortName: json['short_name'] as String,
      apiKey: json['api_key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'short_name': shortName, 'api_key': apiKey};
  }

  Future<void> create() async {
    final rosseteDirectory = Directory('${umkDirectory.path}/.rossete');
    if (!await rosseteDirectory.exists()) {
      await rosseteDirectory.create(recursive: true);
    }

    final configFile = File('${umkDirectory.path}/.rossete/config.json');
    await configFile.writeAsString(toJson().toString());
  }
}
