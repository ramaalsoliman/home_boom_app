import 'package:dio/dio.dart';
import 'package:home_boom_app/Booking/model/model_forUpdate_booking.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_updating.dart';
import 'package:home_boom_app/const.dart';

class ServiceOwnerUpdat {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future<List<ModelForOwnerUpdating>> getallupdate(
    int user_id,
    String token,
  ) async {
    try {
      var response = await dio.post(
        '/getallupdate/$user_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
            validateStatus: (status) => true,
        ),
      );
      if (response.statusCode==200&&response.data['success']==true) {
         List data = response.data['data']  as List;
        return data.map((e) => ModelForOwnerUpdating.fromMap(e)).toList();
        
      } else {
         return [];
      }
    } catch (e) {
       print("Error fetching pending bookings: $e");
      return [];
    }
  }

  Future<ModelForOwnerUpdating?> confirmUpdate(
    int user_id,
    String token,
    int booking_id,
  ) async {
     print("➡️ Service sending booking id = $booking_id"); 
    try {

      var response = await dio.post(
        '/confirmUpdate/$user_id',
        data: {'id_updating': booking_id},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ModelForOwnerUpdating.fromMap(response.data['data']);
      } else {
        print("Failed to confirm updating: ${response.data['message']}");
        return null;
      }
    } catch (e) {
      print("Error confirming updating: $e");
      return null;
    }
  }

  Future<ModelForOwnerUpdating?> rejectupdate(
    int user_id,
    String token,
    int booking_id,
  ) async {
    try {
      var response = await dio.post(
        '/rejectupdate/$user_id',
        data: {'id_updating': booking_id},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode==200&& response.data['success'] == true) {
         return ModelForOwnerUpdating.fromMap(response.data['data']);
      } else {
        print("Failed to reject updating: ${response.data['message']}");
        return null;
      }
    } catch (e) {
       print("Error rejecting updating: $e");
      return null;
    }
  }
}
