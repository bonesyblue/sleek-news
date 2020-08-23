import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:SleekNews/models/secret.dart';
import 'package:flutter/services.dart' show rootBundle;

class SecretService {
  final String secretFilePath;

  SecretService({
    this.secretFilePath,
  });

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(
      this.secretFilePath,
      (jsonStr) async {
        final secret = Secret.fromJson(json.decode(jsonStr));
        return secret;
      },
    );
  }
}
