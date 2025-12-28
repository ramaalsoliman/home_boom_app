// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore: file_names
class ApartmentSpecificationsModel {
  final int id;
  final int userId;
  final String title;
  final String description;
  final double price;
  final double area;
  final int rooms;
  final String startDate;
  final String endDate;
  final String location;
  final String isAvailable;
  final List<String> images;

  ApartmentSpecificationsModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.price,
    required this.area,
    required this.rooms,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.isAvailable,
    required this.images,
  });

  factory ApartmentSpecificationsModel.fromMap(Map<String, dynamic> map) {
    return ApartmentSpecificationsModel(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? 0,
      title: map['title']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      price: double.parse(map['price'].toString()),
      area: double.parse(map['area'].toString()),
      rooms: int.parse(map['rooms'].toString()),
      startDate: map['start_date']?.toString() ?? '',
      endDate: map['end_date']?.toString() ?? '',
      location: map['location']?.toString() ?? '',
      isAvailable: map['is_available']?.toString() ?? '',
      images: [
        map['outdoor_image'],
        map['image_living'],
        map['image_kitchen'],
        map['image_bedroom_1'],
        map['image_bedroom_2'],
        map['bath_room'],
      ]
          .where((e) => e != null && e.toString().isNotEmpty)
          .map((e) => e.toString())
          .toList(),
    );
  }
}
