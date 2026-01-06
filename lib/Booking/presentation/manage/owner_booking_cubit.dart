import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Booking/model/model_for_Booking.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_booking.dart';
import 'package:home_boom_app/Booking/presentation/manage/owner_booking_state.dart';
import 'package:home_boom_app/Booking/service/sevice_owner_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class OwnerBookingCubit extends Cubit<OwnerBookingState> {
  OwnerBookingCubit() : super(OwnerBookingInitial()){
    getOwner();
  }
  SeviceOwnerBooking service = SeviceOwnerBooking();
 

  Future<void> confirmBooking(String token, int ownerId, int bookingId) async {
    

    emit(OwnerBookingLoading());
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");

    if (token == null || userId == null) {
      emit(OwnerBookingFailure( "Token or User ID not found"));
      return;
    }

    try {
      final booking = await service.confirmBooking(ownerId, token, bookingId);
      if (booking != null) {
        emit(OwnerBookingApproved(booking ));
        await getOwner();
      } else {
        emit(OwnerBookingFailure("Failed to approve booking"));
      }
    } catch (e) {
      emit(OwnerBookingFailure(e.toString()));
    }
  }

   Future<void> rejectBooking(String token, int ownerId, int bookingId) async {
    emit(OwnerBookingLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");

    if (token == null || userId == null) {
      emit(OwnerBookingFailure( "Token or User ID not found"));
      
      return;
    }
    try {
      final booking = await service.rejectBooking(ownerId, token, bookingId);
      if (booking != null) {
        emit(OwnerBookingRejected(booking  ));
        await getOwner();
      } else {
        emit(OwnerBookingFailure("Failed to reject booking"));
      }
    } catch (e) {
      emit(OwnerBookingFailure(e.toString()));
    }
  }


    Future<void> getOwner() async {
    emit(OwnerBookingLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");
     if (token == null || userId == null) {
      emit(OwnerBookingFailure("Token or User ID not found"));
      return;
    }

    try {
     
      

      final bookings = await service.getOwner(userId, token);

      if (bookings.isNotEmpty) {
        emit(OwnerBookingLoaded(bookings));
        
      } else {
        emit(OwnerBookingFailure( "No pending booking requests found."));
      }
    } catch (e) {
      emit(OwnerBookingFailure("Error fetching bookings: $e"));
    }
  }
}*/

class OwnerBookingCubit extends Cubit<OwnerBookingState> {
  OwnerBookingCubit() : super(OwnerBookingInitial()) {
    getOwner();
  }

  final SeviceOwnerBooking service = SeviceOwnerBooking();

  
  Future<void> getOwner() async {
   emit(OwnerBookingLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");

    if (token == null || userId == null) {
      emit(OwnerBookingFailure("Token or User ID not found"));
      return;
    }

    try {
      final bookings = await service.getOwner(userId, token);
      if (bookings.isNotEmpty) {
        emit(OwnerBookingLoaded(bookings));
      } else {
        emit(OwnerBookingFailure("No pending bookings found"));
      }
    } catch (e) {
      emit(OwnerBookingFailure("Error fetching bookings: $e"));
    }
  }

  Future<void> confirmBooking( int bookingId) async {
    emit(OwnerBookingLoading());
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  final userId  = prefs.getInt("user_id");

  if (token == null || userId  == null) {
    emit(OwnerBookingFailure("Token or User ID not found"));
    return;
  }

    
    try {
      print("Cubit booking id = $bookingId");
      final booking = await service.confirmBooking(userId , token, bookingId);
      if (booking != null) {
        emit(OwnerBookingApproved(booking));
        await getOwner(); 
      } else {
        emit(OwnerBookingFailure("Failed to approve booking"));
      }
    } catch (e) {
      emit(OwnerBookingFailure(e.toString()));
    }
  }

  Future<void> rejectBooking(int bookingId) async {
    

    emit(OwnerBookingLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("user_id");
    if (token == null || userId == null) {
      emit(OwnerBookingFailure("Token or User ID not found"));
      return;
    }

    try {
      final booking = await service.rejectBooking(userId, token, bookingId);
      if (booking != null) {
        emit(OwnerBookingRejected(booking));
        await getOwner();
      } else {
        emit(OwnerBookingFailure("Failed to reject booking"));
      }
    } catch (e) {
      emit(OwnerBookingFailure(e.toString()));
    }
  }
}
