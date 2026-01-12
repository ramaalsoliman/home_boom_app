// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FavoriteModel {
  final int apartmentId;
  final String title;
  final String outdoor_image;
  final String price;
  final String location;

  FavoriteModel({
   required this.apartmentId,
   required this.title, 
   required this.outdoor_image, 
   required this.price, 
   required this.location
   });


  FavoriteModel copyWith({
    int? apartmentId,
    String? title,
    String? outdoor_image,
    String? price,
    String? location,
  }) {
    return FavoriteModel(
      apartmentId: apartmentId ?? this.apartmentId,
      title: title ?? this.title,
      outdoor_image: outdoor_image ?? this.outdoor_image,
      price: price ?? this.price,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apartmentId': apartmentId,
      'title': title,
      'outdoor_image': outdoor_image,
      'price': price,
      'location': location,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      apartmentId: map['apartment_id'], // ✅ التصحيح
    title: map['title'],
    outdoor_image: map['outdoor_image'],
    price: map['price'].toString(),
    location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) => FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavoriteModel(apartmentId: $apartmentId, title: $title, outdoor_image: $outdoor_image, price: $price, location: $location)';
  }

  @override
  bool operator ==(covariant FavoriteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.apartmentId == apartmentId &&
      other.title == title &&
      other.outdoor_image == outdoor_image &&
      other.price == price &&
      other.location == location;
  }

  @override
  int get hashCode {
    return apartmentId.hashCode ^
      title.hashCode ^
      outdoor_image.hashCode ^
      price.hashCode ^
      location.hashCode;
  }
}
