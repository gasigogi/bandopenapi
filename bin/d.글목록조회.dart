import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/post.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/posts',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'locale': locale,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final list = List<Map<String, dynamic>>.from(json['result_data']['items']);
  final posts = list.map((json) => Post.fromJson(json)).toList();

  if (posts.isNotEmpty) {
    print('#' * 80);
  }

  for (var post in posts) {
    print(post.toString());
    print('#' * 80);
  }
}
