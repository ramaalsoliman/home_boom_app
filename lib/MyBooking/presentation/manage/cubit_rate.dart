import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/MyBooking/presentation/manage/state_rate.dart';
import 'package:home_boom_app/MyBooking/service/service_mybooking.dart';

class CubitBookingRating extends Cubit<RateBookingState> {
  final ServiceMybooking service=ServiceMybooking();

    CubitBookingRating() : super((RateBookingInitial()));


  Future<void> rateBooking({
    required int userId,
    required int bookingId,
    required double rating,
    required String token,
  }) async {
    emit((RateBookingLoading()));
    try {
      await service.addRating(
        userId: userId,
        bookingId: bookingId,
        rating: rating,
        token: token,
      );

      emit(RateBookingSuccess( rating,bookingId));
    } catch (e) {
      emit(RateBookingFailure( e.toString()));
    }
  }
}