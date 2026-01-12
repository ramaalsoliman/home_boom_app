
import 'package:home_boom_app/favorite/model/model_for_favorite.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favorites;

  FavoriteSuccess(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
class FavoriteActionSuccess extends FavoriteState {
  final String message;

  FavoriteActionSuccess(this.message);
}
