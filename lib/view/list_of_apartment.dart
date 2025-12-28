// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:home_boom_app/Apartments/model/Apartment_model.dart';

final List<ApartmentModels> apartmentList = [
  ApartmentModels(
    name: "Urban Sky Terrace",
    price: "\$700",
    image: "assets/app1.jpg",
    descebtion: "Damascus,Kafarsouseh",
  ),
  ApartmentModels(
    name: "Mountain View Lofts",
    price: "\$350",
    image: "assets/app2.jpg",
    descebtion: "Latakia,Mashrou' al-Zira'a",
  ),
    ApartmentModels(
    name: "Midnight Mansion",
    price: "\$180",
    image: "assets/app3.jpg",
    descebtion: "Homs,Al-Ghouta",
  ),
    ApartmentModels(
    name: "The White Haven",
    price: "\$400",
    image: "assets/app4.jpg",
    descebtion: "Aleppo,The Meridian,",
  ),
    ApartmentModels(
    name: "The Glass Box",
    price: "\$600",
    image: "assets/app5.jpg",
    descebtion: "Aleppo,Al-Furqan,",
  ),
    ApartmentModels(
    name: "Lakeside Stone House",
    price: "\$800",
    image: "assets/app6.jpg",
    descebtion: "Damascus,Mezzeh Villas",
  ),
];

class ApartmentModels {
  String name;
  String price;
  String image;
  String descebtion;
  ApartmentModels({
    required this.name,
    required this.price,
    required this.image,
    required this.descebtion,
  });
}
