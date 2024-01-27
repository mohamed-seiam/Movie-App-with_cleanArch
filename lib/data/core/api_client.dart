import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/core/api_constance.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get({required String path, Map<String, dynamic>? queryParams}) async {
    final String finalPath = getPath(path, queryParams??{});
    final response = await _client.get(
      Uri.parse(finalPath),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
