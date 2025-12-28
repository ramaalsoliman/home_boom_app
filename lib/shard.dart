import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = 'token';
Future<void> saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(_tokenKey, token);
  print("Token saved successfully");
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(_tokenKey);
  if (token == null) {
    return null;
  } else {
    print("Retrieved token :$token");
    return token;
  }
}

Future<void> deleteToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(_tokenKey);
  print('Token deleted successfully!');
}
