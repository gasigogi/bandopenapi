import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/band.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2.1/bands',
    {'access_token': accessToken},
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final list = List<Map<String, dynamic>>.from(json['result_data']['bands']);
  final bands = list.map((json) => Band.fromJson(json)).toList();

  if (bands.isNotEmpty) {
    print('#' * 80);
  }

  for (var band in bands) {
    print(band.toString());
    print('#' * 80);
  }
}
