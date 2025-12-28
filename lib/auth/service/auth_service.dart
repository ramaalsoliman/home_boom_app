/*import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:home_boom_app/auth/model/login_model.dart';
import 'package:home_boom_app/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future<void> storeToken(String accessToken) async {
    (await SharedPreferences.getInstance()).setString("token", accessToken);
  }

  Future<User?> Login(Map<String, dynamic> data) async {
    try {
      debugPrint("login1");
      // ignore: unused_local_variable
      var response = await dio.post(
        '/login',
        data: data,
        options: Options(headers: {'Accept': 'Application/json'}),
      );
      debugPrint("login2");
      if (response.statusCode == 200) {
        debugPrint(response.data['token']);
        storeToken(response.data['token']);
        return User.fromMap(response.data['user']);
      } else {
        print("error");
        return null;
      }
    } on DioException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> register({
    required Map<String, dynamic> data,
    required File profileImage,
    required File idImage,
  }) async {
    try {
      debugPrint("register1");
      FormData formData =FormData.fromMap({
        ...data,
        "image":await MultipartFile.fromFile(profileImage.path,filename: "profile.jpg"),
        "id_photo": await MultipartFile.fromFile(idImage.path,filename: "id.jpg"),
        
      });
      var response = await dio.post(
        '/register',
        data: formData,
        options: Options(headers: {'Accept': 'Application/json'}),
      );
      debugPrint("Full response: ${response.data}");
      debugPrint("register");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        debugPrint("Token:${response.data['token']}");
       await storeToken(response.data['token']);
        return User.fromMap(response.data['user']);
      } else {
        debugPrint("register failed with status: ${response.statusCode}");
        return null;
      }
    }  on DioException catch (e) {
  if(e.response != null){
    print("Status Code: ${e.response?.statusCode}");
    print("Response data: ${e.response?.data}");
  } else {
    print("Error: ${e.message}");
  }
  return null;
}
    
    }
  }*/
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:home_boom_app/auth/model/login_model.dart';
import 'package:home_boom_app/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri,connectTimeout: const Duration(seconds: 15), 
  receiveTimeout: const Duration(seconds: 15),),);

  Future<void> storeToken(String accessToken) async {
    (await SharedPreferences.getInstance()).setString("token", accessToken);
  }

  Future<User?> login(Map<String, dynamic> data) async {
    try {
      debugPrint("Login attempt...");
      var response = await dio.post(
        '/login',
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
        
      );

      if (response.statusCode == 200) {
        debugPrint("Login success, token: ${response.data['token']}");
        await storeToken(response.data['token']);
        return User.fromMap(response.data['user']);
      } else if(response.statusCode==403){
      return User.fromMap({
    ...response.data['user'] ?? {},
    'active': 'no'
  });
      }
      else{
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("Login error - Status Code: ${e.response?.statusCode}");
        debugPrint("Response data: ${e.response?.data}");
      } else {
        debugPrint("Login error: ${e.message}");
      }
      return null;
    }
  }

  Future<User?> register({
    required Map<String, dynamic> data,
    required File? profileImage,
    required File? idImage,
  }) async {
    if (profileImage == null || idImage == null) {
      debugPrint("Profile or ID image missing!");
      return null;
    }

    try {
      debugPrint("Register attempt...");

      FormData formData = FormData.fromMap({
        ...data,
        "image": await MultipartFile.fromFile(profileImage.path, filename: "profile.jpg"),
        "id_photo": await MultipartFile.fromFile(idImage.path, filename: "id.jpg"),
      });

      var response = await dio.post(
        '/register',
        data: formData,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      debugPrint("Full response: ${response.data}");

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      
        return User.fromMap(response.data['user']);
      } else {
        debugPrint("Register failed with status: ${response.statusCode}");
        debugPrint("Response data: ${response.data}");
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("Register error - Status Code: ${e.response?.statusCode}");
        debugPrint("Response data: ${e.response?.data}");
      } else {
        debugPrint("Register error: ${e.message}");
      }
      return null;
    }
  }
Future<bool> logout() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");

  if (token == null) return false;

  try {
    var response = await dio.post(
      '/logout',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.statusCode == 200) {
      await prefs.remove("token"); 
      return true;
    } else {
      return false;
    }
  } on DioException catch (e) {
    print(e.response?.data ?? e.message);
    return false;
  }
}

}