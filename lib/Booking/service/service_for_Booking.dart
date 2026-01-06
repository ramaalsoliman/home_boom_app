import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_boom_app/Booking/model/model_forUpdate_booking.dart';
import 'package:home_boom_app/Booking/model/model_for_Booking.dart';
import 'package:home_boom_app/const.dart';

/*class ServiceForBooking {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));
  Future<ModelForBooking> storeBooking(
    String token,
    int userId,
    int apartment_id,
    String start_date,
    String end_date,
  ) async {
    try {
      var response = await dio.post(
        '/storeBooking/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'apartment_id': apartment_id,
          'start_date': start_date,
          'end_date': end_date,
        },
      );
      if (response.statusCode==201) {
     
        return ModelForBooking.fromMap(response.data['data']['booking']);
      } 
      else{
        throw Exception(response.data['message'] ?? 'حدث خطأ أثناء الحجز');
      }
    } on DioException catch (e) {
       throw Exception(e.response?.data['message'] ?? 'فشل الاتصال بالخادم');
    }
   
  }







}*/

class ServiceForBooking {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));

  Future<ModelForBooking> storeBooking(
    String token,
    int userId,
    int apartmentId,
    String startDate,
    String endDate,
  ) async {
    try {
      final response = await dio.post(
        '/storeBooking/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => true, // حتى نتمكن من قراءة جميع الردود
        ),
        data: {
          'apartment_id': apartmentId,
          'start_date': startDate,
          'end_date': endDate,
        },
      );

      // التحقق من وجود data قبل التحويل
      final data = response.data['data'];
      if (response.statusCode == 201 && data != null) {
        // تحويل البيانات إلى الموديل
        return ModelForBooking.fromMap(data);
      } else {
        final message = response.data['message'] ?? 'حدث خطأ أثناء الحجز';
        throw Exception(message);
      }
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
      throw Exception(message);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }

  Future<ModelForupdateBooking?> updateBooking(
    String token,
    int userId,
    int bookingId,
    String? startDate,
    String ?endDate,
  ) async {
    try {
      var response = await dio.post(
        '/updateBooking/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => true,
        ),
        data: {
          "booking_id": bookingId,
          if (startDate != null) "start_date": startDate,
          if (endDate != null) "end_date": endDate,
        },
      );
      if (response.statusCode==200&&response.data['success'] == true) {
        return ModelForupdateBooking.fromMap(response.data['data']);
        
      } else {
         print("Error from server: ${response.data}");
        return null;
      }
    } catch (e) {
      print("Error updating booking: $e");
      return null;
    }
  }

  Future<bool> cancelBooking(
    String token,
    int userId,
    int bookingId,
  
  ) async {
    try {
      var response = await dio.post(
        '/cancelBooking/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => true,
        ),
        data: {
          "booking_id": bookingId,
        
        },
      );
      if (response.statusCode==200&&response.data['success'] == true) {
        return  true;
        
      } else {
         print("Error from server: ${response.data}");
        return false;
      }
    } catch (e) {
     print("Error cancelling booking: $e");
      throw Exception(e.toString());
    }
  }



}
