import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';

/*class FilterService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  
  
  // الفلترة حسب القيم المحددة
  Future<List<FilterModel>?> filterApartments({
    String? province,
    String? location,
    int? minPrice,
    int? maxPrice,
    int? rooms,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (province != null && province.isNotEmpty) body['province'] = province;
      if (location != null && location.isNotEmpty) body['location'] = location;
      if (minPrice != null) body['min_price'] = minPrice;
      if (maxPrice != null) body['max_price'] = maxPrice;
      if (rooms != null) body['rooms'] = rooms;

      if (body.isEmpty) return [];

      var response = await dio.post(
        '/apartments/search',
        data: body,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List data = response.data['data'] as List;
        return data.map((e) => FilterModel.fromMap(e)).toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        debugPrint("Filter error: ${response.data}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception in filter: $e");
      return null;
    }
  }
}*/

/*class FilterService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  Future<List<FilterModel>?> getFilteredApartments({
    String? province,
    String? location,
    int? minPrice,
    int? maxPrice,
    int? rooms,
  }) async {
    try {
      final response = await dio.post(
        '/apartments/search',
        data: {
          'province': province,
          'location': location,
          'min_price': minPrice,
          'max_price': maxPrice,
          'rooms': rooms,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((e) => FilterModel.fromMap(e)).toList();
      } else {
        debugPrint("Failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<String>?> getProvinces() async {
    try {
      final response = await dio.get('/filters/provinces',
      options: Options(headers: {'Accept': 'application/json'}),
        );
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<String>?> getLocations(String province) async {
    try {
      final response = await dio.post('/filters/locations', options: Options(headers: {'Accept': 'application/json'}),
        data: {'province': province});
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<int>?> getRooms() async {
    try {
      final response = await dio.get('/filters/rooms',options: Options(headers: {'Accept': 'application/json'}),
        );
      if (response.statusCode == 200) {
        return List<int>.from(response.data.map((e) => int.parse(e.toString())));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Map<String, int>?> getPriceRange() async {
    try {
      final response = await dio.get('/filters/price-range',options: Options(headers: {'Accept': 'application/json'}),
        );
      if (response.statusCode == 200) {
        return {'min': response.data['min'], 'max': response.data['max']};
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}*/

class FilterService {
  Dio dio=Dio(BaseOptions(baseUrl: baseUri));
  Future<List<FilterModel>?> getFilteredApartments({
  String? province,
  String? location,
  int? min_price,
  int? max_price,
  int? rooms,
}) async {
  try {
    final Map<String, dynamic> body = {};

    if (province != null && province.isNotEmpty) body['province'] = province;
    if (location != null && location.isNotEmpty) body['location'] = location;
    if (min_price != null && min_price > 0) body['min_price'] = min_price;
    if (max_price != null && max_price > 0) body['max_price'] = max_price;
    if (rooms != null && rooms > 0) body['rooms'] = rooms;

    print(" sent filters: $body");

    final response = await dio.post(
      '/apartments/search',
      data: body,
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      return data.map((e) => FilterModel.fromMap(e)).toList();
    }

    return null;
  } catch (e) {
    debugPrint("❌ filter error: $e");
    return null;
  }
}}