abstract class RateBookingState {}

class RateBookingInitial extends RateBookingState {}

class RateBookingLoading extends RateBookingState {}

class RateBookingSuccess extends RateBookingState {
  final double rating;
  final int bookingId;
  RateBookingSuccess(this.rating,this.bookingId);
}

class RateBookingFailure extends RateBookingState {
  final String message;
  RateBookingFailure(this.message);
}