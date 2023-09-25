import 'package:band_open_api/constants.dart';
import 'package:http/http.dart' as http;

void main() async {
  print('#' * 80);
  print('[TEST CASE 1]');
  print('access_token = $accessToken');
  print('#' * 80);
  print('\n');

  print('#' * 80);
  print('[TEST CASE 2]');

  final url = Uri.https('naver.com', '/');
  final response = await http.get(url);
  print('naver.com 에 요청을 보냅니다. status code: ${response.statusCode}');
  print('#' * 80);
}
