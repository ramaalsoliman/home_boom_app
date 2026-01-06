import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_updating.dart';
import 'package:home_boom_app/Booking/presentation/manage/owner_updating_state.dart';
import 'package:home_boom_app/Booking/service/service_owner_updat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerUpdateCubit extends Cubit<OwnerUpdateState> {
  OwnerUpdateCubit() : super(OwnerUpdateInitial());
  ServiceOwnerUpdat service=ServiceOwnerUpdat();
   Future<void> getallupdate() async {
   emit(OwnerUpdateLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");

    if (token == null || userId == null) {
      emit(OwnerUpdateFailure("Token or User ID not found"));
      return;
    }

    try {
      final bookings = await service.getallupdate(userId, token);
      if (bookings!=null) {
        emit(OwnerUpdateLoaded(bookings));
      } else {
        emit(OwnerUpdateFailure("No pending bookings found"));
      }
    } catch (e) {
      emit(OwnerUpdateFailure("Error fetching bookings: $e"));
    }
  }

   Future<void> confirmUpdate( int bookingId) async {
    emit(OwnerUpdateLoading());
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  final userId  = prefs.getInt("user_id");

  if (token == null || userId  == null) {
    emit(OwnerUpdateFailure("Token or User ID not found"));
    return;
  }

    
    try {
      print("Cubit booking id = $bookingId");
    final result=await service.confirmUpdate(userId, token, bookingId);
    if (result!=null) {
     await getallupdate();
    } else {
      emit(OwnerUpdateFailure("Failed to approve update"));
    }
    } catch (e) {
      emit(OwnerUpdateFailure(e.toString()));
    }
  }

  Future<void> rejectBooking(int bookingId) async {
    

    emit(OwnerUpdateLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");
    if (token == null || userId == null) {
      emit(OwnerUpdateFailure("Token or User ID not found"));
      return;
    }

    try {
      final booking = await service.rejectupdate(userId, token, bookingId);
      if (booking != null) {
       
        await getallupdate(); 
      } else {
        emit(OwnerUpdateFailure("Failed to reject booking"));
      }
    } catch (e) {
      emit(OwnerUpdateFailure(e.toString()));
    }
  }

}