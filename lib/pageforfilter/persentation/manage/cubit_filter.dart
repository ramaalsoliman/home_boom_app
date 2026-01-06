import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_filter.dart';
import 'package:home_boom_app/pageforfilter/service/filter_service.dart';

/*class CubitFilter extends Cubit<StateFilter> {
  FilterService service = FilterService();

  CubitFilter() : super(ApartmentFilterInitial());

  Future<void> getFilteredApartments({
    String? province,
    String? location,
    int? minPrice,
    int? maxPrice,
    int? rooms,
  }) async {
    emit(ApartmentFilterLoading());

    try {
      final List<FilterModel>? apartments = await service.getFilteredApartments(
        province: province,
        location: location,
        minPrice: minPrice,
        maxPrice: maxPrice,
        rooms: rooms,
      );

      if (apartments == null) {
        emit(ApartmentFilterFauiler(message: "Server returned an error or bad request"));
      } else if (apartments.isEmpty) {
        emit(ApartmentFilterEmpty());
      } else {
        emit(ApartmentFilterSuccess(apartments));
      }
    } catch (e) {
      emit(ApartmentFilterFauiler(message: "Exception: ${e.toString()}"));
    }
  }
}*/

/*class CubitFilter extends Cubit<StateFilter> {
  final FilterService service = FilterService();

  CubitFilter() : super(ApartmentFilterInitial());

  // جلب جميع الفلاتر
  Future<void> fetchFilters() async {
    try {
      final provinces = await service.
      getProvinces();
      if (provinces == null) throw Exception("Failed to load provinces");

      Map<String, List<String>> locationsByProvince = {};
      for (var province in provinces) {
        final locations = await service.getLocations(province);
        locationsByProvince[province] = locations ?? [];
      }

      final rooms = await service.getRooms();
      if (rooms == null) throw Exception("Failed to load rooms");

      final priceRange = await service.getPriceRange();
      if (priceRange == null) throw Exception("Failed to load price range");

      emit(FilterSuccess(
        provinces: provinces,
        locationsByProvince: locationsByProvince,
        rooms: rooms,
        priceRange: priceRange,
      ));
    } catch (e) {
      emit(ApartmentFilterFauiler(message: e.toString()));
    }
  }

  // جلب الشقق بناءً على الفلاتر
  Future<void> getFilteredApartments({
    String? province,
    String? location,
    int? minPrice,
    int? maxPrice,
    int? rooms,
  }) async {
    emit(ApartmentFilterLoading());
    try {
      final apartments = await service.getFilteredApartments(
        province: province,
        location: location,
        minPrice: minPrice,
        maxPrice: maxPrice,
        rooms: rooms,
      );

      if (apartments == null || apartments.isEmpty) {
        emit(ApartmentFilterEmpty());
      } else {
        emit(ApartmentFilterSuccess(apartments));
      }
    } catch (e) {
      emit(ApartmentFilterFauiler(message: e.toString()));
    }
  }
}*/

class CubitFilter extends Cubit<StateFilter> {
  CubitFilter() : super(ApartmentFilterInitial());
  FilterService service = FilterService();
  Future<void> getFilteredApartments({
    String? province,
    String? location,
    int? min_price,
    int? max_price,
    int? rooms,
  }) async {
    emit(ApartmentFilterLoading());
     try {
    final response = await service.getFilteredApartments(
      province: province,
      location: location,
      min_price: min_price,
      max_price: max_price,
      rooms: rooms,
    );

    if (response == null || response.isEmpty) {
      emit(ApartmentFilterEmpty());
    } else {
      emit(ApartmentFilterrSuccess(response));
    }
  } catch (e) {
      debugPrint("FILTER ERROR => $e");
      emit(ApartmentFilterFauiler(message: e.toString()));
      
    }}
}