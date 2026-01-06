import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:home_boom_app/const.dart';

class FilteroptionService {
  Dio dio=Dio(BaseOptions(baseUrl: baseUri));
  Future<List<String>?> getProvinces()async{
    try {
       var response= await dio.get('/filters/provinces',
     options: Options(headers: {'Accept': 'application/json'}),);
     if(response.statusCode==200){
      return List<String>.from(response.data["data"]);
     }
     else{
         debugPrint("get provinces failed with status: ${response.statusCode}");
        debugPrint("Response: ${response.data}");
        return null;
      }
    
    } catch (e) {
       debugPrint(e.toString());
      return null;
      
    }
   

  }
  Future<List<String>?>getLocationsByProvince(String province)async{
    try {
      var response=await dio.post('/filters/locations',options: Options(headers: {'Accept': 'application/json'}),queryParameters: {'province':province});
      if (response.statusCode==200) {
         return List<String>.from(response.data["data"]);

        
      } else {
         debugPrint("get locations failed with status: ${response.statusCode}");
        debugPrint("Response: ${response.data}");
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }


  }
  Future<List<int>?> getRooms()async{
    try {
      var response=await dio.get('/filters/rooms',options: Options(headers: {'Accept': 'application/json'}));
      if (response.statusCode==200) {
        return List<int>.from(response.data["data"]);
        
      } else {
        debugPrint("get rooms failed with status: ${response.statusCode}");
        debugPrint("Response: ${response.data}");
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
  Future<Map<String, int>?>getPriceRange()async{
    try {
      var response=await dio.get('/filters/price-range',options: Options(headers: {'Accept': 'application/json'}));
      if (response.statusCode==200) {
        return {
         'min_price':response.data["min_price"],
        'max_price' :response.data["max_price"]
        };
        
      } else {
         debugPrint("get price failed with status: ${response.statusCode}");
        debugPrint("Response: ${response.data}");
        return null;
      }
    } catch (e) {
       debugPrint(e.toString());
      return null;
    }
  }
  
}
