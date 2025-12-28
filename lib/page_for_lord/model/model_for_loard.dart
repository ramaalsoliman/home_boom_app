import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelForLoard {
   int id;
  String title;
  int price;
  int rooms;
  String outdoor_image;
  String location;
  String number_phone;
  ModelForLoard({
    required this.id,
    required this.title,
    required this.price,
    required this.outdoor_image,
    required this.location,
    required this.number_phone,
    required this.rooms
  });
  

  ModelForLoard copyWith({
    int? id,
    String? title,
    int? price,
    String? outdoor_image,
    String? location,
    String? number_phone,
    int?rooms,
  }) {
    return ModelForLoard(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      outdoor_image: outdoor_image ?? this.outdoor_image,
      location: location ?? this.location,
      number_phone: number_phone ?? this.number_phone,
      rooms: rooms??this.rooms
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'outdoor_image': outdoor_image,
      'location': location,
      'number_phone': number_phone,
      'rooms':rooms
    };
  }

  factory ModelForLoard.fromMap(Map<String, dynamic> map) {
    return ModelForLoard(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      outdoor_image: map['outdoor_image'] as String,
      location: map['location'] as String,
      number_phone: map['number_phone'] as String,
      rooms: map['rooms']as int
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelForLoard.fromJson(String source) => ModelForLoard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelForLoard(id: $id, title: $title, price: $price, outdoor_image: $outdoor_image, location: $location, number_phone: $number_phone,rooms:$rooms)';
  }

  @override
  bool operator ==(covariant ModelForLoard other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.price == price &&
      other.outdoor_image == outdoor_image &&
      other.location == location &&
      other.rooms==rooms&&
      other.number_phone == number_phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      rooms.hashCode^
      outdoor_image.hashCode ^
      location.hashCode ^
      number_phone.hashCode;
  }
}
