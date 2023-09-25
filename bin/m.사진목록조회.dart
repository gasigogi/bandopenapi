import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/photo.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/album/photos',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'photo_album_key': photoAlbumKey,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final list = List<Map<String, dynamic>>.from(json['result_data']['items']);
  final photos = list.map((json) => Photo.fromJson(json)).toList();

  if (photos.isNotEmpty) {
    print('#' * 80);
  }

  for (var photo in photos) {
    print(photo.toString());
    print('#' * 80);
  }
}
