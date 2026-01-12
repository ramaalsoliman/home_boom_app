import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartments/model/Apartment_model.dart';
import 'package:home_boom_app/Apartments/presentation/manage/state_apartment.dart';
import 'package:home_boom_app/Apartments/service/apartment_service.dart';

class CubitApartment extends Cubit<StateApartment> {
  CubitApartment() : super(ApartmentInitial());
  final ApartmentService service  =ApartmentService();
  Future<void>getallApartment()async{
    emit(ApartmentLoading());
    List<ApartmentModel>? apartments =
    await service.getApartments();
    if (apartments!=null) {
emit(ApartmentSuccess(apartments));

    }
    else{
      emit(ApartmentFailure(message: "Failed to load apartments"));
    }
  }
  void updateApartmentRating(int apartmentId, double rating) {
    if (state is ApartmentSuccess) {
      final currentState = state as ApartmentSuccess;
      final updatedApartments = currentState.apartments.map((apt) {
        if (apt.id == apartmentId) {
          return apt.copyWith(rating: rating); // تحتاج copyWith في موديل ApartmentModel
        }
        return apt;
      }).toList();
      emit(ApartmentSuccess(updatedApartments));
    }
  }
}