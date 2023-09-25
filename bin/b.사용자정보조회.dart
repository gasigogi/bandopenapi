import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/profile.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/profile',
    {'access_token': accessToken},
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final profile = Profile.fromJson(json['result_data']);

  print('#' * 80);
  print(profile.toString());
  print('#' * 80);
}
