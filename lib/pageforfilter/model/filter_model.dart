import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModel {
   final int id;
 
  final String title;
  final String province;
  final int price;
  final String location;
  final String outdoor_image;
  FilterModel({
    required this.id,

    required this.title,
    required this.province,
    required this.price,
    required this.location,
    required this.outdoor_image,
  });


  FilterModel copyWith({
    int? id,
  
    String? title,
    String? description,
    int? price,
    String? location,
    String? outdoor_image,
  }) {
    return FilterModel(
      id: id ?? this.id,
    
      title: title ?? this.title,
      province: province ?? this.province,
      price: price ?? this.price,
      location: location ?? this.location,
      outdoor_image: outdoor_image ?? this.outdoor_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
     
      'title': title,
      'province': province,
      'price': price,
      'location': location,
      'outdoor_image': outdoor_image,
    };
  }

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      id: map['id'] as int,
 
      title: map['title'] as String,
      province: map['province'] as String,
      price: map['price'] as int,
      location: map['location'] as String,
      outdoor_image: map['outdoor_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterModel.fromJson(String source) => FilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FilterModel(id: $id, title: $title, province: $province, price: $price, location: $location, outdoor_image: $outdoor_image)';
  }

  @override
  bool operator ==(covariant FilterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.province == province &&
      other.price == price &&
      other.location == location &&
      other.outdoor_image == outdoor_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      province.hashCode ^
      price.hashCode ^
      location.hashCode ^
      outdoor_image.hashCode;
  }
}
