import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/model/apartment%20_specifications.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/state_apartment%20_specifications.dart';
import 'package:home_boom_app/Apartment%20Specifications/service/apartment%20_specifications_service.dart';

class CubitApartmentSpecifications extends Cubit<StateApartmentSpecifications> {
  CubitApartmentSpecifications() : super(ApartmentSpecificationsInitial());
  final ApartmentSpecificationsService service =
      ApartmentSpecificationsService();
  Future<void> getApartmentById(int id) async {
    emit(ApartmentSpecificationsLoading());
    ApartmentSpecificationsModel? apartmentbyid = await service
        .getApartmentsById(id);
    if (apartmentbyid != null) {
      emit(ApartmentSpecificationsSuccess(apartmentbyid));
    } else {
      emit(ApartmentSpecificationsFailure(message: "Apartment not found"));
    }
  }
}
