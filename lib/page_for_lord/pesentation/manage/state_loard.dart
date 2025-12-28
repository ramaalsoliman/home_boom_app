import 'package:home_boom_app/page_for_lord/model/model_for_loard.dart';

abstract class StateLoard {}
class LoardApartmentInitial extends StateLoard {}

class LoardApartmentLoading extends StateLoard {}

class LoardApartmentSuccess extends StateLoard {
  final List<ModelForLoard> apartments;

  LoardApartmentSuccess({required this.apartments});
}

class LoardApartmentFailure extends StateLoard {
  final String message;

  LoardApartmentFailure({required this.message});
}

class ApartmentDeleted extends StateLoard {
  final int id; // الـ id يلي تم حذفه

  ApartmentDeleted({required this.id});
}

class ApartmentUpdated extends StateLoard {
  final ModelForLoard apartment;

  ApartmentUpdated({required this.apartment});
}