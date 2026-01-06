import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelForRate {
 final int id;
  final int user_id;
  final int bookingId;
  final int apartmentId;
  final double? rating; // ممكن يكون فارغ (null)
  final String end_date;
  final String start_date;
  final int total_days;
  final double total_price;
  final String status;

  ModelForRate({
    required this.id,
    required this.user_id,
    required this.bookingId,
    required this.apartmentId,
    this.rating,
    required this.end_date,
    required this.start_date,
    required this.total_days,
    required this.total_price,
    required this.status,
  });

  ModelForRate copyWith({
    int? id,
    int? user_id,
    int? bookingId,
    int? apartmentId,
    double? rating,
    String? end_date,
    String? start_date,
    int? total_days,
    double? total_price,
    String? status,
  }) {
    return ModelForRate(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      bookingId: bookingId ?? this.bookingId,
      apartmentId: apartmentId ?? this.apartmentId,
      rating: rating ?? this.rating,
      end_date: end_date ?? this.end_date,
      start_date: start_date ?? this.start_date,
      total_days: total_days ?? this.total_days,
      total_price: total_price ?? this.total_price,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'bookingId': bookingId,
      'apartmentId': apartmentId,
      'rating': rating,
      'end_date': end_date,
      'start_date': start_date,
      'total_days': total_days,
      'total_price': total_price,
      'status': status,
    };
  }

  factory ModelForRate.fromMap(Map<String, dynamic> map) {
    return ModelForRate(
       id: map['id'] as int,
    user_id: map['user_id'] as int,
    bookingId: map['bookingId'] as int,
    apartmentId: map['apartmentId'] as int,
    rating: map['rating'] != null ? (map['rating'] as num).toDouble() : null,
    end_date: map['end_date'] as String,
    start_date: map['start_date'] as String,
    total_days: map['total_days'] != null ? map['total_days'] as int : 0,
    total_price: map['total_price'] != null ? (map['total_price'] as num).toDouble() : 0.0,
    status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForRate.fromJson(String source) =>
      ModelForRate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForRate(id: $id, user_id: $user_id, bookingId: $bookingId, apartmentId: $apartmentId, rating: $rating, end_date: $end_date, start_date: $start_date, total_days: $total_days, total_price: $total_price, status: $status)';
  }

  @override
  bool operator ==(covariant ModelForRate other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.bookingId == bookingId &&
        other.apartmentId == apartmentId &&
        other.rating == rating &&
        other.end_date == end_date &&
        other.start_date == start_date &&
        other.total_days == total_days &&
        other.total_price == total_price &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        bookingId.hashCode ^
        apartmentId.hashCode ^
        rating.hashCode ^
        end_date.hashCode ^
        start_date.hashCode ^
        total_days.hashCode ^
        total_price.hashCode ^
        status.hashCode;
  }
}
