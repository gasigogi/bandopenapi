import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/post.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2.1/band/post',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'post_key': postKey,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final post = Post.fromJson(json['result_data']['post']);

  print('#' * 80);
  print(post.toString());
  print('#' * 80);
}
