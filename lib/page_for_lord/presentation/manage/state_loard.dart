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
  final int id; 
  ApartmentDeleted({required this.id});
}

class ApartmentUpdated extends StateLoard {
  final ModelForLoard apartment;

  ApartmentUpdated({required this.apartment});
   
 
}

class UpdateApartmentFailure extends StateLoard {
  final String message;

  UpdateApartmentFailure({required this.message});
}
class DeleteApartmentFailure extends StateLoard {
  final String message;

  DeleteApartmentFailure({required this.message});
}
class DeleteApartmentSuccess extends StateLoard {
  final int id;
  DeleteApartmentSuccess(this.id);}

  class UpdateApartmentSuccess extends StateLoard {
  final ModelForLoard apartment;
  UpdateApartmentSuccess(this.apartment);

}