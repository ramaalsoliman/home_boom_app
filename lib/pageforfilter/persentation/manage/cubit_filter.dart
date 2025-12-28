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

class CubitFilter extends Cubit<StateFilter> {
  final FilterService service = FilterService();

  CubitFilter() : super(ApartmentFilterInitial());

  // البحث النصي
  Future<void> searchApartments(String query) async {
    emit(ApartmentFilterLoading());

    final List<FilterModel>? results = await service.searchApartments(query: query);

    if (results == null) {
      emit(ApartmentFilterFauiler(message: "Server returned an error or bad request"));
    } else if (results.isEmpty) {
      emit(ApartmentFilterEmpty());
    } else {
      emit(ApartmentFilterSuccess(results));
    }
  }

  // الفلترة حسب القيم
  Future<void> filterApartments({
    String? province,
    String? location,
    int? minPrice,
    int? maxPrice,
    int? rooms,
  }) async {
    emit(ApartmentFilterLoading());

    final List<FilterModel>? results = await service.filterApartments(
      province: province,
      location: location,
      minPrice: minPrice,
      maxPrice: maxPrice,
      rooms: rooms,
    );

    if (results == null) {
      emit(ApartmentFilterFauiler(message: "Server returned an error or bad request"));
    } else if (results.isEmpty) {
      emit(ApartmentFilterEmpty());
    } else {
      emit(ApartmentFilterSuccess(results));
    }
  }
}