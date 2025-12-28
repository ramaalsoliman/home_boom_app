import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
class ApartmentModel {
   final int id;
  String title;
  int price;
  String outdoor_image;
  String location;
  ApartmentModel({
      required this.id,
    required this.title,
    required this.price,
    required this.outdoor_image,
    required this.location,
  });

  ApartmentModel copyWith({
    String? title,
    int? price,
    String? outdoor_image,
    String? location,
  }) {
    return ApartmentModel(
       id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      outdoor_image: outdoor_image ?? this.outdoor_image,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'title': title,
      'price': price,
      'outdoor_image': outdoor_image,
      'location': location,
    };
  }

  factory ApartmentModel.fromMap(Map<String, dynamic> map) {
    return ApartmentModel(
      // استخدام toString و toInt لضمان عدم حدوث خطأ إذا جاءت البيانات بشكل مختلف
      id: map['id'],
       title: map['title']?.toString() ?? '',
      price: (map['price'] as num?)?.toInt() ?? 0,
      outdoor_image: map['outdoor_image']?.toString() ?? '',
      location: map['location']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApartmentModel.fromJson(String source) => ApartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApartmentModel(id: $id,,title: $title, price: $price, outdoor_image: $outdoor_image, location: $location)';
  }

  @override
  bool operator ==(covariant ApartmentModel other) {
    if (identical(this, other)) return true;
  
    return 
    other.id == id &&
      other.title == title &&
      other.price == price &&
      other.outdoor_image == outdoor_image &&
      other.location == location;
  }

  @override
  int get hashCode {
    return
    id.hashCode ^
     title.hashCode ^
      price.hashCode ^
      outdoor_image.hashCode ^
      location.hashCode;
  }

  
}

class ApartmentsResponse {
  final String message;
  final int count;
  final List<ApartmentModel> apartments;

  ApartmentsResponse({
    required this.message,
    required this.count,
    required this.apartments,
  });


  ApartmentsResponse copyWith({
    String? message,
    int? count,
    List<ApartmentModel>? apartments,
  }) {
    return ApartmentsResponse(
      message: message ?? this.message,
      count: count ?? this.count,
      apartments: apartments ?? this.apartments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'count': count,
      'apartments': apartments.map((x) => x.toMap()).toList(),
    };
  }
factory ApartmentsResponse.fromMap(Map<String, dynamic> map) {
  return ApartmentsResponse(
    message: map['message']?.toString() ?? '',
    count: (map['count'] as num?)?.toInt() ?? 0,
    apartments: map['data'] != null 
        ? List<ApartmentModel>.from(
            (map['data'] as List).map(
              (x) => ApartmentModel.fromMap(x as Map<String, dynamic>),
            ),
          )
        : [],
  );
}


  String toJson() => json.encode(toMap());

  factory ApartmentsResponse.fromJson(String source) => ApartmentsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApartmentsResponse(message: $message, count: $count, apartments: $apartments)';

  @override
  bool operator ==(covariant ApartmentsResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.count == count &&
      listEquals(other.apartments, apartments);
  }

  @override
  int get hashCode => message.hashCode ^ count.hashCode ^ apartments.hashCode;
}
