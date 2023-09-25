import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.https(
    'openapi.band.us',
    '/v2/band/post/comment/remove',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'post_key': postKey,
      'comment_key': commentKey,
    },
  );

  final response = await http.post(url);
  final json = Map<String, dynamic>.from(convert.jsonDecode(response.body));
  final bool isSuccess = (json['result_code'] as int? ?? 0) == 1;
  if (isSuccess) {
    print('성공');
  } else {
    print('실패');
  }
}
