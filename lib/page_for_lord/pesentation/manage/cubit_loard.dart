import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartments/presentation/manage/state_apartment.dart';
import 'package:home_boom_app/page_for_lord/model/model_for_loard.dart';
import 'package:home_boom_app/page_for_lord/pesentation/manage/state_loard.dart';
import 'package:home_boom_app/page_for_lord/service/service_loard.dart';

class CubitLoard extends Cubit<StateLoard> {
  ServiceLoard servaice=ServiceLoard();
  CubitLoard() : super(LoardApartmentInitial());
 Future<void> updateApartment(ModelForLoard apartment) async {
    emit(LoardApartmentLoading());
    ModelForLoard?model=await servaice.updatedApartment(apartment);
    if (model!=null) {
      emit(ApartmentUpdated(apartment: model));
     // await getAllApartments();
      
    } else {
      emit(LoardApartmentFailure(message: "Failed to update apartment"));
      
    }
      
  }
  Future<void>deleteApartment(int id,String number_phone)async{
    emit(LoardApartmentLoading());
    final success=await servaice.deletedApartment(id, number_phone);
    if (success) {
      emit(ApartmentDeleted(id: id));
      // await getAllApartments();
      
    } else {
      emit(LoardApartmentFailure(message: "Failed to delete apartment"));
      
    }

  }
}