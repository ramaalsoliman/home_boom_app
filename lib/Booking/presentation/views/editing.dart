import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Booking/presentation/manage/owner_update_cubit.dart';
import 'package:home_boom_app/Booking/presentation/manage/owner_updating_state.dart';

class OwnerPendingUpdatesScreen extends StatelessWidget {
  const OwnerPendingUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerUpdateCubit()..getallupdate(),
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        appBar: AppBar(
          backgroundColor: const Color(0xff7eaf96),
          elevation: 0,
          title: const Text("Update Requests"),
          centerTitle: true,
        ),
        body: BlocBuilder<OwnerUpdateCubit, OwnerUpdateState>(
          builder: (context, state) {
            if (state is OwnerUpdateLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is OwnerUpdateFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is OwnerUpdateLoaded) {
              final bookings = state.bookings;

              if (bookings.isEmpty) {
                return const Center(
                  child: Text(
                    "No update requests",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: bookings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final booking = bookings[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.network(
                            booking.outdoor_image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// title
                              Text(
                                booking.apartment_title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              /// dates
                              Text(
                                "${booking.start_date} → ${booking.end_date}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 6),

                              /// price
                              Text(
                                "New Price: \$${booking.total_price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              /// status
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.orange.withOpacity(.2),
                                ),
                                child: const Text(
                                  "Waiting for approval",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              /// buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<OwnerUpdateCubit>()
                                          .confirmUpdate(
                                            booking.id_updating,
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text("Approve"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<OwnerUpdateCubit>()
                                          .rejectBooking(
                                            booking.id_updating,
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text("Reject"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
