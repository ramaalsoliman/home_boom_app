// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:home_boom_app/Apartment%20Specifications/model/apartment%20_specifications.dart';
import 'package:home_boom_app/const.dart';

class ApartmentSpecificationsService {
   Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  Future<ApartmentSpecificationsModel?> getApartmentsById(int id) async {
    try {
      final response = await dio.get('/details/$id');

      if (response.statusCode == 200) {
        final data = response.data['data']; 
        return ApartmentSpecificationsModel.fromMap(data);

        
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