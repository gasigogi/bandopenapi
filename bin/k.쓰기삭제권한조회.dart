import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:http/http.dart' as http;

void main() async {
  final String permissions = [
    'posting',
    'commenting',
    'contents_deletion',
  ].join(',');

  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/permissions',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'permissions': permissions,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  print(json['result_data']['permissions']);
}
