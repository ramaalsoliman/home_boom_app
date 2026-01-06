import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Booking/presentation/manage/state_for_Booking.dart';
import 'package:home_boom_app/Booking/service/service_for_Booking.dart';

class CubitForBooking extends Cubit<StateForBooking> {
  CubitForBooking() : super(BookingInitial());
  ServiceForBooking service = ServiceForBooking();
  Future<void> storeBooking(
    String token,
    int user_id,
    int apartment_id,
    String start_date,
    String end_date,
    
  ) async {
    emit(BookingLoading());
    try {
      final response = await service.storeBooking(
        token,
        user_id,
        apartment_id,
        start_date,
        end_date,
      );
      emit(BookingSuccess(response));
    } catch (e) {
      emit(BookingFauiler(message: e.toString()));
    }
  }

Future<void> updateBooking(
    String token,
    int user_id,
    int booking_id,
    String? start_date,
    String ?end_date,
    
  ) async {
    emit(BookingUpdateLoading());
    try {
      final response = await service.updateBooking(
        token,
        user_id,
        booking_id,
        start_date ,
        end_date ,
      );
      if (response!=null) {
         emit(BookingUpdateSuccess(response));
      } else {
        emit(BookingUpdateFauiler(message: "Failed to update booking"));
      }
     
    } catch (e) {
      emit(BookingUpdateFauiler(message: e.toString()));
    }
  }

Future<void> cancelBooking(
    String token,
    int user_id,
    int booking_id,
   
    
  ) async {
    emit(BookingcancelLoading());
    try {
      final response = await service.cancelBooking(
        token,
        user_id,
        booking_id,
       
      );
      if (response) {
         emit(BookingcancelSuccess(message: "Booking cancelled successfully."));
      } else {
        emit(BookingcancelFauiler(message: "Failed to cancel booking"));
      }
     
    } catch (e) {
      emit(BookingcancelFauiler(message: e.toString()));
    }
  }


}
