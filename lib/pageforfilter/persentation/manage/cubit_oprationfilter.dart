import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_opreationfilter.dart';
import 'package:home_boom_app/pageforfilter/service/filteroption_service.dart';

class CubitOprationfilter extends Cubit<StateOpreationfilter> {
  CubitOprationfilter() : super(FilterOptionInitial());

  final FilteroptionService service = FilteroptionService();

  Future<void> loadFilterOptions() async {
    emit(FilterOptionLoading());
    try {
      final provinces = await service.getProvinces();
      final rooms = await service.getRooms();
      final priceRange = await service.getPriceRange();

      if (provinces == null || rooms == null || priceRange == null) {
        emit(FilterOptionFauiler(message: "Failed to load filter options"));
        return;
      }

      emit(ApartmentFilterSuccess(
        provinces: provinces,
        rooms: rooms,
        min_price: priceRange['min_price']!,
        max_price: priceRange['max_price']!,
      ));
    } catch (e) {
      emit(FilterOptionFauiler(message: e.toString()));
    }
  }

  Future<void> loadLocationsByProvince(String province) async {
    emit(FilterLocationsLoading()); 
    try {
      final locations = await service.getLocationsByProvince(province);
      if (locations == null) {
        emit(FilterOptionFauiler(message: "Failed to load locations"));
      } else {
        emit(FilterLocationsLoaded(locations));
      }
    } catch (e) {
      emit(FilterOptionFauiler(message: e.toString()));
    }
  }
}
