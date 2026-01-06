// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: file_names
class ModelForupdateBooking {
  final int booking_id;
  final int new_total_days;
  final double total_price;
  final String start_date;
  final String end_date;
  final String status;
  final String apartment_title;
  final String outdoor_image;

  ModelForupdateBooking({
    required this.booking_id,
    required this.new_total_days,
    required this.total_price,
    required this.start_date,
    required this.end_date,
    required this.status,
    required this.apartment_title,
    required this.outdoor_image,
  });

  ModelForupdateBooking copyWith({
    int? booking_id,
    int? new_total_days,
    double? total_price,
    String? start_date,
    String? end_date,
    String? status,
    String? apartment_title,
    String? outdoor_image,
  }) {
    return ModelForupdateBooking(
      booking_id: booking_id ?? this.booking_id,
      new_total_days: new_total_days ?? this.new_total_days,
      total_price: total_price ?? this.total_price,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      status: status ?? this.status,
      apartment_title: apartment_title ?? this.apartment_title,
      outdoor_image: outdoor_image ?? this.outdoor_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'booking_id': booking_id,
      'new_total_days': new_total_days,
      'total_price': total_price,
      'start_date': start_date,
      'end_date': end_date,
      'status': status,
      'apartment_title': apartment_title,
      'outdoor_image': outdoor_image,
    };
  }

  factory ModelForupdateBooking.fromMap(Map<String, dynamic> map) {
    return ModelForupdateBooking(
     booking_id: (map['booking_id'] as num?)?.toInt() ?? 0,
    status: map['status']?.toString() ?? '',
    start_date: map['start_date']?.toString() ?? '',
    end_date: map['end_date']?.toString() ?? '',
    new_total_days: (map['new_total_days'] as num?)?.toInt() ?? 0,  // لو أضفتها
    total_price: (map['total_price'] as num?)?.toDouble() ?? 0.0,
    apartment_title: map['apartment_title']?.toString() ?? '',
    outdoor_image: map['outdoor_image']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForupdateBooking.fromJson(String source) => ModelForupdateBooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForupdateBooking(booking_id: $booking_id, new_total_days: $new_total_days, total_price: $total_price, start_date: $start_date, end_date: $end_date, status: $status, apartment_title: $apartment_title, outdoor_image: $outdoor_image)';
  }

  @override
  bool operator ==(covariant ModelForupdateBooking other) {
    if (identical(this, other)) return true;
  
    return 
      other.booking_id == booking_id &&
      other.new_total_days == new_total_days &&
      other.total_price == total_price &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.status == status &&
      other.apartment_title == apartment_title &&
      other.outdoor_image == outdoor_image;
  }

  @override
  int get hashCode {
    return booking_id.hashCode ^
      new_total_days.hashCode ^
      total_price.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      status.hashCode ^
      apartment_title.hashCode ^
      outdoor_image.hashCode;
  }
}
