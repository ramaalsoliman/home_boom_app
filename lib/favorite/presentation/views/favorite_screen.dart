import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';
import 'package:home_boom_app/favorite/model/model_for_favorite.dart';
import 'package:home_boom_app/favorite/presentation/manage/FavoriteCubit.dart';
import 'package:home_boom_app/favorite/presentation/manage/favorite_state.dart';


class FavoritesPage extends StatelessWidget {
  final int userId;
  final String token;

  const FavoritesPage({
    super.key,
    required this.userId,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    // تحميل المفضلات عند فتح الصفحة
    context.read<FavoriteCubit>().getFavorites(userId, token);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: const Color(0xff7eaf96),
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteActionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is FavoriteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoriteError) {
            return Center(child: Text(state.message));
          }

          if (state is FavoriteSuccess) {
            if (state.favorites.isEmpty) {
              return const Center(
                child: Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final fav = state.favorites[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ApartmentDetails(apartmentId: fav.apartmentId),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.network(
                            fav.outdoor_image,
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fav.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  fav.location,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${fav.price}",
                                      style: const TextStyle(
                                        color: Color(0xff7eaf96),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Color(0xff7eaf96),
                                      ),
                                      onPressed: () {
                                        // إزالة من المفضلة أو إعادة تحميل
                                        context
                                            .read<FavoriteCubit>()
                                            .addToFavorite(
                                              userId,
                                              fav.apartmentId,
                                              token,
                                            );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
