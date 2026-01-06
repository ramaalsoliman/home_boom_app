// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FilteroptionModel {
  final int id;
  final List<String> provinces;
  final Map<String, List<String>> locationsByProvince;
  final List<int> rooms;
  final int min_price;
  final int max_price;

  FilteroptionModel({
    required this.id,
    required this.provinces,
    required this.locationsByProvince,
    required this.rooms,
    required this.min_price,
    required this.max_price,
  });


  FilteroptionModel copyWith({
    int?id,
    List<String>? provinces,
    Map<String, List<String>>? locationsByProvince,
    List<int>? rooms,
    int? min_price,
    int? max_price,
  }) {
    return FilteroptionModel(
      id: id??this.id,
      provinces: provinces ?? this.provinces,
      locationsByProvince: locationsByProvince ?? this.locationsByProvince,
      rooms: rooms ?? this.rooms,
      min_price: min_price ?? this.min_price,
      max_price: max_price ?? this.max_price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'provinces': provinces,
      'locationsByProvince': locationsByProvince,
      'rooms': rooms,
      'min_price': min_price,
      'max_price': max_price,
    };
  }

   factory FilteroptionModel.fromMap(Map<String, dynamic> map) {
    return FilteroptionModel(
      id:map['id'] ,
      provinces: List<String>.from(map['provinces']),
      locationsByProvince: (map['locationsByProvince'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
      rooms: List<int>.from(map['rooms']),
      min_price: map['min_price'],
      max_price: map['max_price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilteroptionModel.fromJson(String source) => FilteroptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FilteroptionModel(provinces: $provinces, locationsByProvince: $locationsByProvince, rooms: $rooms, min_price: $min_price, max_price: $max_price,id:$id)';
  }

  @override
  bool operator ==(covariant FilteroptionModel other) {
    if (identical(this, other)) return true;
  
    return 
    other.id==id&&
      listEquals(other.provinces, provinces) &&
      mapEquals(other.locationsByProvince, locationsByProvince) &&
      listEquals(other.rooms, rooms) &&
      other.min_price == min_price &&
      other.max_price == max_price;
  }

  @override
  int get hashCode {
    return
    id.hashCode^
     provinces.hashCode ^
      locationsByProvince.hashCode ^
      rooms.hashCode ^
      min_price.hashCode ^
      max_price.hashCode;
  }
 }
