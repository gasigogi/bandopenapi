import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/album.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/albums',
    {
      'access_token': accessToken,
      'band_key': bandKey,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final list = List<Map<String, dynamic>>.from(json['result_data']['items']);
  final albums = list.map((json) => Album.fromJson(json)).toList();

  if (albums.isNotEmpty) {
    print('#' * 80);
  }

  for (var album in albums) {
    print(album.toString());
    print('#' * 80);
  }
}
