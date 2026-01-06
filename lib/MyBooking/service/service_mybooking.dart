import 'package:dio/dio.dart';
import 'package:home_boom_app/MyBooking/model/model_Mybooking.dart';
import 'package:home_boom_app/const.dart';

class ServiceMybooking {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future<List<ModelMybooking>?> getMyBookings(int user_id, String token) async {
    try {
      var response = await dio.get(
        '/getMyBookings/$user_id',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode==200) {
          final data=response.data['data'] as List;
       return data.map((e) => ModelMybooking.fromMap(e)).toList();
      } else {
         print('Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
        print('Error fetching bookings: $e');
      return null;
    }
  }
 Future<void> addRating({
    required int userId,
    required int bookingId,
    required double rating,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        '/bookings/rate/$userId',
        data: {
          'booking_id': bookingId,
          'rating': rating,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200 || response.data['success'] != true) {
        throw Exception('Failed to add rating: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('Error adding rating: $e');
    }
  }
}
