import 'package:dio/dio.dart';
import 'package:home_boom_app/Booking/model/model_for_owner_booking.dart';
import 'package:home_boom_app/const.dart';

/*class ServicePendingBooking {
  Dio dio=Dio(BaseOptions(baseUrl: baseUri));
  Future<List<ModelForPendingBooking>> getOwner(int user_id, String token) async {
  try {
    var response = await dio.post(
      '/getOwner/$user_id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        validateStatus: (status) => true,
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      if (response.data['data'] == null) return [];
      List data = response.data['data'] as List;
      return data.map((item) => ModelForPendingBooking.fromMap(item)).toList();
    } else {
      print("Failed: ${response.data['message']}");
      return [];
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
}*/
/*class ServicePendingBooking {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  Future<List<ModelForPendingBooking>> getOwner(int user_id, String token) async {
    try {
      var response = await dio.post(
        '/getOwner/$user_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        if (response.data['data'] == null) return [];
        List data = response.data['data'] as List;
        return data.map((item) => ModelForPendingBooking.fromMap(item)).toList();
      } else {
        print("Failed: ${response.data['message']}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
*/