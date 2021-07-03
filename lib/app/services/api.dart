import 'package:flutter/material.dart';
import 'package:rest_api_practoce/app/services/api_keys.dart';

class API {
  API({@required this.apiKey});

  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
      );
}
