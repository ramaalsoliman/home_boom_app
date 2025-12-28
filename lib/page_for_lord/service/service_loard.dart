import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/page_for_lord/model/model_for_loard.dart';

class ServiceLoard {
  Dio dio=Dio(BaseOptions(baseUrl: baseUri));
  Future<ModelForLoard?>updatedApartment(ModelForLoard apartment)async{
    try {
      var response=await dio.post('/apartmentsUpdate',
        data: {
          'id': apartment.id,
          'phone_number': apartment.number_phone,
          'price': apartment.price,
          'rooms': apartment.rooms,
        },
      options: Options(headers: {'Accept':'application/json'}),);
      if (response.statusCode==200) {
        return ModelForLoard.fromMap(response.data['apartment']);
        
      } else {
         debugPrint("Update failed: ${response.statusCode}");
      debugPrint("Response: ${response.data}");
      return null;
      }
    } catch (e) {
       debugPrint(e.toString());
    return null;
      
    }
  }
Future<bool>deletedApartment(int id, String number_phone)async{
  try {
    var response=await dio.post('/apartments/destroy',data: {
        'id': id,
        'number_phone': number_phone,
      },
    options: Options(headers: {'Accept':'application/json'}));
    if (response.statusCode==200) {
      return true;
      
    } else {
      debugPrint("Delete failed: ${response.statusCode}");
      debugPrint("Response: ${response.data}");
      return false;
      
    }
  } catch (e) {
    debugPrint(e.toString());
    return false; 
    
  }
}
}