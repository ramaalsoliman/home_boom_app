// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DescribtionModel {
  String name;
  String location;
  String size;
  String price;
  String describtion;
  List<String>imagedes;
  DescribtionModel({
    required this.name,
    required this.location,
    required this.size,
    required this.imagedes,
    required this.price,
    required this.describtion
  });
  
  
}


final List<DescribtionModel> desmodel = [
  DescribtionModel(
    name: "Urban Sky Terrace",
    location: "Damascus,Kafarsouseh",
    size: "3500",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
     price: "\$700",
     describtion: " Modern Urban Living. A stunning apartment featuring floor-to-ceiling windows and a spacious terrace overlooking the city's vibrant plaza. Perfect for those who love the energy of the city"
  ),
  DescribtionModel(
    name: "Mountain View Lofts",
    location: "Latakia,Mashrou' al-Zira'a",
    size: "3400",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
    price: "\$350",
    describtion: "The Onyx Residence. A sophisticated blend of dark brick and stone architecture. This apartment offers a cozy yet bold industrial feel with breathtaking mountain views."
  ),
  DescribtionModel(
    name: "Midnight Mansion",
    location: "Homs,Al-Ghouta",
    size: "3300",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
     price: "\$180",
     describtion: "Midnight Elegance. A masterpiece of modern architecture. This dark-themed villa exudes luxury and mystery, featuring sharp geometric lines and hidden ambient lighting."

  ),
  DescribtionModel(
    name: "The White Haven",
    location: "Aleppo,The Meridian",
    size: "3200",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
     price: "\$400",
     describtion: "The Royal Marble Palace. An exquisite villa wrapped in premium marble textures. It’s a symbol of purity and high-end living, surrounded by minimalist landscaping. "
  ),
  DescribtionModel(
    name: "The Glass Box",
    location: "Aleppo,Al-Furqan,",
    size: "3100",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
     price: "\$600",
     describtion: "The Zen Pavilion. A transparent design that blurs the lines between indoor luxury and outdoor nature. Features an open-plan layout with direct access to a private garden "
  ),
  DescribtionModel(
    name: "Lakeside Stone House",
    location: "Damascus,Mezzeh Villas",
    size: "3000",
    imagedes: ["assets/app1.jpg","assets/app2.jpg","assets/app3.jpg"],
     price: "\$800",
     describtion: "The Infinity Retreat. A luxury vacation home featuring a stunning infinity pool and stone-cladded walls. Designed for ultimate relaxation with a direct view of the lake."
  ),
];

