import 'package:home_boom_app/Apartments/model/Apartment_model.dart';

abstract class StateApartment {}

class ApartmentInitial extends StateApartment {}

class ApartmentLoading extends StateApartment {}

class ApartmentSuccess extends StateApartment {
  final List<ApartmentModel>  apartments;
  ApartmentSuccess(this.apartments);
}

class ApartmentFailure extends StateApartment {
  final String message;

  ApartmentFailure({required this.message});
}
