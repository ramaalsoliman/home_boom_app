import 'package:home_boom_app/Booking/model/model_for_Booking.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_booking.dart';

abstract class OwnerBookingState {}
class OwnerBookingInitial extends OwnerBookingState {}


class OwnerBookingLoading extends OwnerBookingState {}

class OwnerBookingLoaded extends OwnerBookingState {
  final List<ModelForOwnerBooking> bookings;
  OwnerBookingLoaded(this.bookings);
}
class OwnerBookingApproved extends OwnerBookingState {
  final ModelForOwnerBooking bookings;

  OwnerBookingApproved(this.bookings);
}


class OwnerBookingRejected extends OwnerBookingState {
  final ModelForOwnerBooking bookings;

  OwnerBookingRejected(this.bookings);
}


class OwnerBookingFailure extends OwnerBookingState {
  final String message;

  OwnerBookingFailure(this.message);
}