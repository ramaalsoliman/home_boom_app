import 'package:home_boom_app/Booking/model/model_forUpdate_booking.dart';
import 'package:home_boom_app/MyBooking/model/model_Mybooking.dart';

abstract class StateMybooking {}

class MyBookingInitial extends StateMybooking{}
class MyBookingLoading extends StateMybooking{}
class MyBookingSuccess extends StateMybooking{
  
final List<ModelMybooking> mybookings;  
 MyBookingSuccess(this.mybookings);

}
class MyBookingFauiler extends StateMybooking{
  final String message;

  MyBookingFauiler({required this.message});


}
class BookingcancelInitial extends StateMybooking{}
class BookingcancelLoading extends StateMybooking{}
class BookingcancelSuccess extends StateMybooking{
  
final String message;
  BookingcancelSuccess({required this.message});

}
class BookingcancelFauiler extends StateMybooking{
  final String message;

  BookingcancelFauiler({required this.message});


}
