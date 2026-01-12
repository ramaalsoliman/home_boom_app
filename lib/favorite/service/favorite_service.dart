import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/favorite/model/model_for_favorite.dart';
import 'package:home_boom_app/shard.dart';

class FavoriteService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUri));


  Future<void> addToFavorite({required int userId,required int apartmentId,required String token, }) async {
 
     
      var response = await dio.post('/favorites/add/$userId',
        data: {
          'apartment_id': apartmentId,
        },
        options: Options(
          headers: {'Accept': 'application/json',
          'Authorization':'Bearer $token'
          },

        ),
      );

    
  }

 
  Future<List<FavoriteModel>> getFavorites(int userId, String token,) async {
  
  
       var response = await dio.get('/favorites/$userId',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization':'Bearer $token'
          },
        )
      );
      
          final data=response.data['data'] as List;
       return data.map((e) => FavoriteModel.fromMap(e)).toList();
     
  
    
}}