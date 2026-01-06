import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelForOwnerUpdating {
  final int id_updating;
  final String start_date;
  final String end_date;
  final String apartment_title;
  final String outdoor_image;
  final String status;
  final double total_price;
  ModelForOwnerUpdating({
    required this.id_updating,
    required this.start_date,
    required this.end_date,
    required this.apartment_title,
    required this.outdoor_image,
    required this.status,
    required this.total_price,
  });

  ModelForOwnerUpdating copyWith({
    int? id_updating,
    String? start_date,
    String? end_date,
    String? apartment_title,
    String? outdoor_image,
    String? status,
    double? total_price,
  }) {
    return ModelForOwnerUpdating(
      id_updating: id_updating ?? this.id_updating,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      apartment_title: apartment_title ?? this.apartment_title,
      outdoor_image: outdoor_image ?? this.outdoor_image,
      status: status ?? this.status,
      total_price: total_price ?? this.total_price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_updating': id_updating,
      'start_date': start_date,
      'end_date': end_date,
      'apartment_title': apartment_title,
      'outdoor_image': outdoor_image,
      'status': status,
      'total_price': total_price,
    };
  }

  factory ModelForOwnerUpdating.fromMap(Map<String, dynamic> map) {
    return ModelForOwnerUpdating(
      id_updating: (map['id_updating'] as num?)?.toInt() ?? 0,
      total_price: (map['total_price'] is String)
          ? double.tryParse(map['total_price']) ?? 0.0
          : (map['total_price'] as num?)?.toDouble() ?? 0.0,
      start_date: map['start_date']?.toString() ?? '',
      end_date: map['end_date']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      apartment_title: map['apartment_title']?.toString() ?? '',
      outdoor_image: map['outdoor_image']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForOwnerUpdating.fromJson(String source) => ModelForOwnerUpdating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForOwnerUpdating(id_updating: $id_updating, start_date: $start_date, end_date: $end_date, apartment_title: $apartment_title, outdoor_image: $outdoor_image, status: $status, total_price: $total_price)';
  }

  @override
  bool operator ==(covariant ModelForOwnerUpdating other) {
    if (identical(this, other)) return true;
  
    return 
      other.id_updating == id_updating &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.apartment_title == apartment_title &&
      other.outdoor_image == outdoor_image &&
      other.status == status &&
      other.total_price == total_price;
  }

  @override
  int get hashCode {
    return id_updating.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      apartment_title.hashCode ^
      outdoor_image.hashCode ^
      status.hashCode ^
      total_price.hashCode;
  }
}
