import 'package:home_boom_app/Booking/model/model_forUpdate_booking.dart';
import 'package:home_boom_app/Booking/model/model_for_Booking.dart';

abstract class StateForBooking {}
class BookingInitial extends StateForBooking{}
class BookingLoading extends StateForBooking{}
class BookingSuccess extends StateForBooking{
  
final  ModelForBooking booking;
 BookingSuccess(this.booking);

}
class BookingFauiler extends StateForBooking{
  final String message;

  BookingFauiler({required this.message});


}
class BookingUpdateInitial extends StateForBooking{}
class BookingUpdateLoading extends StateForBooking{}
class BookingUpdateSuccess extends StateForBooking{
  
final  ModelForupdateBooking booking;
 BookingUpdateSuccess(this.booking);

}
class BookingUpdateFauiler extends StateForBooking{
  final String message;

  BookingUpdateFauiler({required this.message});


}
class MyBookingUpdateSuccess extends StateForBooking{
  final String message;

  MyBookingUpdateSuccess({required this.message});

}

class BookingcancelInitial extends StateForBooking{}
class BookingcancelLoading extends StateForBooking{}
class BookingcancelSuccess extends StateForBooking{
  
final String message;
 BookingcancelSuccess({required this.message});

}
class BookingcancelFauiler extends StateForBooking{
  final String message;

  BookingcancelFauiler({required this.message});


}
