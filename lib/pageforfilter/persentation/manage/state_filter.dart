import 'package:home_boom_app/pageforfilter/model/filter_model.dart';

abstract class StateFilter {}
class ApartmentFilterInitial  extends StateFilter{}
class ApartmentFilterLoading extends StateFilter{}
class ApartmentFilterrSuccess extends StateFilter{
  
final List<FilterModel> apartment;
ApartmentFilterrSuccess(this.apartment);

}
class ApartmentFilterEmpty extends StateFilter {}
class ApartmentFilterFauiler extends StateFilter{
  final String message;

  ApartmentFilterFauiler({required this.message});


}

