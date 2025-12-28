import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:home_boom_app/Apartments/model/Apartment_model.dart';
import 'package:home_boom_app/const.dart';

class ApartmentService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future <List<ApartmentModel>?> getApartments() async {
    try {
      var response = await dio.get(
        '/apartments',
        options: Options(headers: {'Accept': 'application/json'}),
        
        
      );
      if (response.statusCode==200) {
    final data = ApartmentsResponse.fromMap(response.data as Map<String, dynamic>);
        return data.apartments;

        
      }
      else{
         debugPrint("get apartments failed with status: ${response.statusCode}");
        debugPrint("Response: ${response.data}");
        return null;
      }
    } catch (e) {
       debugPrint(e.toString());
      return null;
    }
  }
}
