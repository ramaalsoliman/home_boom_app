import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartments/presentation/manage/state_apartment.dart';
import 'package:home_boom_app/page_for_lord/model/model_for_loard.dart';
import 'package:home_boom_app/page_for_lord/presentation/manage/state_loard.dart';
import 'package:home_boom_app/page_for_lord/service/service_loard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitLoard extends Cubit<StateLoard> {
  ServiceLoard servaice=ServiceLoard();
  CubitLoard() : super(LoardApartmentInitial());
 Future<void> updateApartment(int id,int price, int rooms,) async {
    emit(LoardApartmentLoading());

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
     final userId = prefs.getInt("user_id");
      final number_phone=prefs.getString("number_phone");
      print("Retrieved phone number BEFORE request: $number_phone");

    if (token == null||number_phone==null) {
      emit(UpdateApartmentFailure(message: "Token or Phone number not found"));
      return;
    }

     final result = await servaice.updatedApartment(id, number_phone, price, rooms, token);

    if (result != null) {
      emit(UpdateApartmentSuccess( result));
      await getOwnerApartments(); 
    } else {
      emit(UpdateApartmentFailure(message: "Failed to update apartment"));
    }
  }
  Future<void>deleteApartment(int id,)async{
    emit(LoardApartmentLoading());

    final prefs = await SharedPreferences.getInstance();
     final userId = prefs.getInt("user_id");
    final token = prefs.getString("token");
   final number_phone=prefs.getString("number_phone");
   print(" Retrieved phone number BEFORE request: $number_phone");

    if (token == null||number_phone==null) {
      emit(DeleteApartmentFailure(message: "Token or Phone number not found"));
      return;
    }

    final result = await servaice.deletedApartment(id);

    if (result) {
      emit(DeleteApartmentSuccess(id));
      await getOwnerApartments();
    } else {
      emit(DeleteApartmentFailure(message: "Failed to delete apartment"));
    }
  }
  
  Future<void> getOwnerApartments() async {
  emit(LoardApartmentLoading());

  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt("user_id");
  final token = prefs.getString("token");

  if (userId == null || token == null) {
    emit(LoardApartmentFailure(message: "User ID or Token not found"));
    return;
  }

  List<ModelForLoard>? model = await servaice.getOwnerApartments(userId, token);
  if (model != null) {
    emit(LoardApartmentSuccess(apartments: model));
  } else {
    emit(LoardApartmentFailure(message: "Apartment owner not found"));
  }
}


}