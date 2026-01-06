import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelForBooking {
  final int id;
  final int user_id;
  final int apartment_id;
  final String start_date;
  final String end_date;
  final int total_days;
  final double total_price;
  final String status;
  final String apartment_title;
 final  String outdoor_image;
  ModelForBooking({
    required this.id,
    required this.user_id,
    required this.apartment_id,
    required this.start_date,
    required this.end_date,
    required this.total_days,
    required this.total_price,
    required this.status,
    required this.apartment_title,
    required this.outdoor_image,
  });


  ModelForBooking copyWith({
    int? id,
    int? user_id,
    int? apartment_id,
    String? start_date,
    String? end_date,
    int? total_days,
    double? total_price,
    String? status,
    String? apartment_title,
    String? outdoor_image,
  }) {
    return ModelForBooking(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      apartment_id: apartment_id ?? this.apartment_id,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      total_days: total_days ?? this.total_days,
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
      'total_days': total_days,
      'total_price': total_price,
      'status': status,
      'apartment_title': apartment_title,
      'outdoor_image': outdoor_image,
    };
  }

  factory ModelForBooking.fromMap(Map<String, dynamic> map) {
    return ModelForBooking(
     id: (map['id'] as num?)?.toInt() ?? 0,
    user_id: (map['user_id'] as num?)?.toInt() ?? 0,
    apartment_id: (map['apartment_id'] as num?)?.toInt() ?? 0,
    start_date: map['start_date']?.toString() ?? '',
    end_date: map['end_date']?.toString() ?? '',
    total_days: (map['total_days'] as num?)?.toInt() ?? 0,
    total_price: (map['total_price'] as num?)?.toDouble() ?? 0.0,
    status: map['status']?.toString() ?? '',
    apartment_title: map['apartment_title']?.toString() ?? '',
    outdoor_image: map['outdoor_image']?.toString() ?? '',
    
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForBooking.fromJson(String source) => ModelForBooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForBooking(id: $id, user_id: $user_id, apartment_id: $apartment_id, start_date: $start_date, end_date: $end_date, total_days: $total_days, total_price: $total_price, status: $status, apartment_title: $apartment_title, outdoor_image: $outdoor_image)';
  }

  @override
  bool operator ==(covariant ModelForBooking other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.apartment_id == apartment_id &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.total_days == total_days &&
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
      total_days.hashCode ^
      total_price.hashCode ^
      status.hashCode ^
      apartment_title.hashCode ^
      outdoor_image.hashCode;
  }
}
