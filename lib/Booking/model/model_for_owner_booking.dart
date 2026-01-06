// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class ModelForOwnerBooking {
  int id;
int user_id;
int apartment_id;
String start_date;
String end_date;
double total_price;
String status;
String apartment_title;
String outdoor_image;
  ModelForOwnerBooking({
    required this.id,
    required this.user_id,
    required this.apartment_id,
    required this.start_date,
    required this.end_date,
    required this.total_price,
    required this.status,
    required this.apartment_title,
    required this.outdoor_image,
  });


  ModelForOwnerBooking copyWith({
    int? id,
    int? user_id,
    int? apartment_id,
    String? start_date,
    String? end_date,
    double? total_price,
    String? status,
    String? apartment_title,
    String? outdoor_image,
  }) {
    return ModelForOwnerBooking(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      apartment_id: apartment_id ?? this.apartment_id,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      total_price: total_price ?? this.total_price,
      status: status ?? this.status,
      apartment_title: apartment_title ?? this.apartment_title,
      outdoor_image: outdoor_image ?? this.outdoor_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'apartment_id': apartment_id,
      'start_date': start_date,
      'end_date': end_date,
      'total_price': total_price,
      'status': status,
      'apartment_title': apartment_title,
      'outdoor_image': outdoor_image,
    };
  }

  factory ModelForOwnerBooking.fromMap(Map<String, dynamic> map) {
    return ModelForOwnerBooking(
     id: map['booking_id'] != null ? int.tryParse(map['booking_id'].toString()) ?? 0 : 0,
    user_id: map['user_id'] != null ? int.tryParse(map['user_id'].toString()) ?? 0 : 0,
    apartment_id: map['apartment_id'] != null ? int.tryParse(map['apartment_id'].toString()) ?? 0 : 0,
    start_date: map['start_date']?.toString() ?? "",
    end_date: map['end_date']?.toString() ?? "",
    total_price: map['total_price'] != null
        ? double.tryParse(map['total_price'].toString()) ?? 0.0
        : 0.0,
    status: map['status']?.toString() ?? "pending",
    apartment_title: map['apartment_title']?.toString() ?? "no title",
    outdoor_image: map['outdoor_image']?.toString() ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForOwnerBooking.fromJson(String source) => ModelForOwnerBooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForOwnerBooking(id: $id, user_id: $user_id, apartment_id: $apartment_id, start_date: $start_date, end_date: $end_date, total_price: $total_price, status: $status, apartment_title: $apartment_title, outdoor_image: $outdoor_image)';
  }

  @override
  bool operator ==(covariant ModelForOwnerBooking other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.apartment_id == apartment_id &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.total_price == total_price &&
      other.status == status &&
      other.apartment_title == apartment_title &&
      other.outdoor_image == outdoor_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      apartment_id.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      total_price.hashCode ^
      status.hashCode ^
      apartment_title.hashCode ^
      outdoor_image.hashCode;
  }
}
