import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/page_for_lord/model/model_for_loard.dart';
import 'package:home_boom_app/shard.dart';
import 'package:shared_preferences/shared_preferences.dart';


 



  /*Future<bool>updatedApartment( int id,
    String number_phone,
    int price,
    int rooms,
    String token)
    
    async{
    try {
      
      var response=await dio.post('/apartmentsUpdate',
        data: {
          'id': id,
          'number_phone': number_phone,
          'price': price,
          'rooms': rooms,
        },
      options: Options(headers: {'Accept':'application/json',"Authorization": "Bearer $token",}),);
     if (response.statusCode == 200 && response.data['status'] == true) {
      print("UPDATED SUCCESSFULLY");
      return true;
    }
    print("FAILED UPDATE: ${response.data}");
    return false;
  } catch (e) {
    print("ERROR UPDATE: $e");
    return false;
  }

  }*/

  class ServiceLoard {
  Dio dio=Dio(BaseOptions(baseUrl: baseUri));
Future<bool>deletedApartment(int id, )async{
  try {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
final userId = prefs.getInt("user_id");
final number_phone = prefs.getString("number_phone");
    var response=await dio.post('/apartments/destroy',data: {
        'id': id,
        'number_phone': number_phone,
      },
    options: Options(
       validateStatus: (status) => true,
      headers: {'Accept':'application/json',}));
      print('Response data: ${response.data}');
    if (response.statusCode == 200 &&
        response.data['message'] != null &&
        response.data['message'].toString().contains("successfully deleted")) {
      print("DELETED SUCCESSFULLY");
      return true;
    }

    print("FAILED DELETE: ${response.data}");
    return false;
  } catch (e) {
    print("ERROR DELETE: $e");
    return false;
  }
}

Future<ModelForLoard?> updatedApartment(int id, String number_phone, int price, int rooms, String token) async {
  try {
    final prefs = await SharedPreferences.getInstance();
      final number_phone = prefs.getString("number_phone");
    var response = await dio.post(
      '/apartmentsUpdate',
      data: {
        'id': id,
        'number_phone': number_phone,
        'price': price,
        'rooms': rooms,
      },
      options: Options(
         validateStatus: (status) => true,
        headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }),
    );
    print('Response data: ${response.data}');

    if (response.statusCode == 200) {
      return ModelForLoard.fromMap(response.data['apartment']);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

Future<List<ModelForLoard>?>getOwnerApartments(int userId,String token)async{
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs .getString("token");
    final user_id = prefs.getInt("user_id");
    
    if (token == null || user_id == null) return null;
    var response=await dio.get('/userApartment/$userId',
    options: Options(headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',}));

    if (response.statusCode==200) {
      final data=response.data['data'] as List;
       return data.map((e) => ModelForLoard.fromMap(e)).toList();
      
    } else {
        print('Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching apartment: $e');
      return null;
    }

}
}