import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelMybooking {
  final int apartmentId;
  final int booking_id;
  final String status;
  final String start_date;
  final String end_date;
  final double total_price;
  final String apartment_title;
  final String outdoor_image;
   double? rating; 
  ModelMybooking({
    required this.apartmentId,
    required this.booking_id,
    required this.status,
    required this.start_date,
    required this.end_date,
    required this.total_price,
    required this.apartment_title,
    required this.outdoor_image,
    required this.rating,
  });

  ModelMybooking copyWith({
    int?apartmentId,
    int? booking_id,
    String? status,
    String? start_date,
    String? end_date,
    double? total_price,
    String? apartment_title,
    String? outdoor_image,
    double?rating,
  }) {
    return ModelMybooking(
      apartmentId: apartmentId??this.apartmentId,
      booking_id: booking_id ?? this.booking_id,
      status: status ?? this.status,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      total_price: total_price ?? this.total_price,
      apartment_title: apartment_title ?? this.apartment_title,
      outdoor_image: outdoor_image ?? this.outdoor_image,
      rating: rating??this.rating
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apartmentId':apartmentId,
      'booking_id': booking_id,
      'status': status,
      'start_date': start_date,
      'end_date': end_date,
      'total_price': total_price,
      'apartment_title': apartment_title,
      'outdoor_image': outdoor_image,
      'rating':rating,
    };
  }

  factory ModelMybooking.fromMap(Map<String, dynamic> map) {
    return ModelMybooking(
      apartmentId: map['apartment_id'],
      booking_id: map['booking_id'] as int,
      status: map['status'] as String,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
        total_price: double.parse(map['total_price'].toString()),
      apartment_title: map['apartment_title'] as String,
      outdoor_image: map['outdoor_image'] as String,
       rating: map['rating'] != null
          ? (map['rating'] as num).toDouble()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelMybooking.fromJson(String source) => ModelMybooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelMybooking(apartmentId:$apartmentId,rating:$rating,booking_id: $booking_id, status: $status, start_date: $start_date, end_date: $end_date, total_price: $total_price, apartment_title: $apartment_title, outdoor_image: $outdoor_image)';
  }

  @override
  bool operator ==(covariant ModelMybooking other) {
    if (identical(this, other)) return true;
  
    return 
    other.apartmentId==apartmentId&&
    other.rating==rating&&
      other.booking_id == booking_id &&
      other.status == status &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.total_price == total_price &&
      other.apartment_title == apartment_title &&
      other.outdoor_image == outdoor_image;
  }

  @override
  int get hashCode {

    return
    apartmentId.hashCode^
    rating.hashCode^
     booking_id.hashCode ^
      status.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      total_price.hashCode ^
      apartment_title.hashCode ^
      outdoor_image.hashCode;
  }
  }
