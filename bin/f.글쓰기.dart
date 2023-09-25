import 'dart:convert' as convert;

import 'package:band_open_api/constants.dart';
import 'package:http/http.dart' as http;

void main() async {
  const String content = '테스트 글 입니다.';

  final url = Uri.https(
    'openapi.band.us',
    '/v2.2/band/post/create',
    {
      'access_token': accessToken,
      'band_key': bandKey,
      'content': content,
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
