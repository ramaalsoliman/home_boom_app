import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/MyBooking/presentation/manage/state_mybooking.dart';
import 'package:home_boom_app/MyBooking/service/service_mybooking.dart';

class CubitMybooking extends Cubit<StateMybooking> {
  CubitMybooking() : super(MyBookingInitial());
  ServiceMybooking service=ServiceMybooking();
  Future<void>getMyBookings(int user_id,String token)async{
    emit(MyBookingLoading());
    try {
      final mybooking =await service.getMyBookings(user_id, token);
      if (mybooking!=null) {
        emit(MyBookingSuccess(mybooking));
      } else {
        emit(MyBookingFauiler(message: "There are no bookings at the moment"));
      }
    } catch (e) {
      emit(MyBookingFauiler(message: "Error while fetching data"));
    }
  }



  
}