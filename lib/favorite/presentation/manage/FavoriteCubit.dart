import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/favorite/model/model_for_favorite.dart';
import 'package:home_boom_app/favorite/presentation/manage/favorite_state.dart';
import 'package:home_boom_app/favorite/service/favorite_service.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteService service=FavoriteService();

  FavoriteCubit() : super(FavoriteInitial());

  
  Future<void> getFavorites(int userId, String token) async {
    emit(FavoriteLoading());
    
    try {
      final favorites =await service.getFavorites(userId,token); 
      emit(FavoriteSuccess(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> addToFavorite(int userId, int apartmentId, String token) async {
     emit(FavoriteLoading());
    try {
      final fav=await service.addToFavorite(
        userId: userId,
        apartmentId: apartmentId,
        token: token
      );
      emit(FavoriteActionSuccess ('Added to favorites'));
      getFavorites(userId, token);
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}