import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:band_open_api/model/comment.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/post/comments',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'post_key': postKey,
    },
  );

  final response = await http.get(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final list = List<Map<String, dynamic>>.from(json['result_data']['items']);
  final comments = list.map((json) => Comment.fromJson(json)).toList();

  if (comments.isNotEmpty) {
    print('#' * 80);
  }

  for (var comment in comments) {
    print(comment.toString());
    print('#' * 80);
  }
}
