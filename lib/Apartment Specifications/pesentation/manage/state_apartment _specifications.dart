// ignore: file_names
import 'package:home_boom_app/Apartment%20Specifications/model/apartment%20_specifications.dart';

abstract class StateApartmentSpecifications {}
class ApartmentSpecificationsInitial extends StateApartmentSpecifications {}

class ApartmentSpecificationsLoading extends StateApartmentSpecifications {}

class ApartmentSpecificationsSuccess extends StateApartmentSpecifications {
  final ApartmentSpecificationsModel  apartments;
  ApartmentSpecificationsSuccess(this.apartments);
}

class ApartmentSpecificationsFailure extends StateApartmentSpecifications {
  final String message;

  ApartmentSpecificationsFailure({required this.message});
}
