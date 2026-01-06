import 'package:dio/dio.dart';
import 'package:home_boom_app/Booking/model/model_for_Booking.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_booking.dart';
import 'package:home_boom_app/const.dart';

class SeviceOwnerBooking {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future<ModelForOwnerBooking?> confirmBooking(
    int user_id,
    String token,
    int booking_id,
  ) async {
     print("➡️ Service sending booking id = $booking_id"); 
    try {

      var response = await dio.post(
        '/confirmBooking/$user_id',
        data: {'booking_id': booking_id},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ModelForOwnerBooking.fromMap(response.data['data']);
      } else {
        print("Failed to confirm booking: ${response.data['message']}");
        return null;
      }
    } catch (e) {
      print("Error confirming booking: $e");
      return null;
    }
  }

  Future<ModelForOwnerBooking?> rejectBooking(
    int user_id,
    String token,
    int booking_id,
  ) async {
    try {
      var response = await dio.post(
        '/rejectBooking/$user_id',
        data: {'booking_id': booking_id},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode==200&& response.data['success'] == true) {
         return ModelForOwnerBooking.fromMap(response.data['data']);
      } else {
        print("Failed to reject booking: ${response.data['message']}");
        return null;
      }
    } catch (e) {
       print("Error rejecting booking: $e");
      return null;
    }
  }


   Future<List<ModelForOwnerBooking>> getOwner(int user_id, String token) async {
    try {
      final response = await dio.post(
        '/getOwner/$user_id',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        List data = response.data['data']  as List;
        return data.map((e) => ModelForOwnerBooking.fromMap(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching pending bookings: $e");
      return [];
    }
  }


   
}
