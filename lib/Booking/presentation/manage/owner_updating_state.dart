import 'package:home_boom_app/Booking/model/model_for_owner_updating.dart';

abstract class OwnerUpdateState {}
class OwnerUpdateInitial extends OwnerUpdateState {}


class OwnerUpdateLoading extends OwnerUpdateState {}

class OwnerUpdateLoaded extends OwnerUpdateState {
  final List<ModelForOwnerUpdating> bookings;
 OwnerUpdateLoaded(this.bookings);
}
class OwnerUpdateApproved extends OwnerUpdateState {
  final ModelForOwnerUpdating bookings;

 OwnerUpdateApproved(this.bookings);
}


class OwnerUpdateRejected extends OwnerUpdateState {
  final ModelForOwnerUpdating bookings;

  OwnerUpdateRejected(this.bookings);
}


class OwnerUpdateFailure extends OwnerUpdateState {
  final String message;

  OwnerUpdateFailure(this.message);
}