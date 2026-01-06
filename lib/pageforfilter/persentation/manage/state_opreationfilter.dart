import 'package:home_boom_app/pageforfilter/model/filteroption_model.dart';

abstract class StateOpreationfilter {}

class FilterOptionInitial  extends StateOpreationfilter{}

class FilterOptionLoading extends StateOpreationfilter{}

class FilterLocationsLoading extends StateOpreationfilter {}

class FilterOptionFauiler extends StateOpreationfilter{
  final String message;

  FilterOptionFauiler({required this.message});


} 

class ApartmentFilterSuccess extends StateOpreationfilter{
  
 final List<String> provinces;
  final List<int> rooms;
  final int min_price;
  final int max_price;

  ApartmentFilterSuccess({
    required this.provinces,
    required this.rooms,
    required this.min_price,
    required this.max_price,
  });

}

class FilterLocationsLoaded extends StateOpreationfilter {
  final List<String> locations;
  FilterLocationsLoaded(this.locations);
}



