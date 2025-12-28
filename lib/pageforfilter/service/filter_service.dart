import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';

class FilterService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  // البحث النصي فقط
  Future<List<FilterModel>?> searchApartments({String? query}) async {
    try {
      if (query == null || query.isEmpty) return [];

      var response = await dio.post(
        '/apartments/search',
        data: {'description': query, 'location': query, 'province': query},
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List data = response.data['data'] as List;
        return data.map((e) => FilterModel.fromMap(e)).toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        debugPrint("Search error: ${response.data}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception in search: $e");
      return null;
    }
  }

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
}