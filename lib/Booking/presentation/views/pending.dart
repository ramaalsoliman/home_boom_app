
//class Pending {}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';

import 'package:home_boom_app/Booking/presentation/manage/owner_booking_cubit.dart';
import 'package:home_boom_app/Booking/presentation/manage/owner_booking_state.dart';

import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';

/*class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
void initState() {
  super.initState();
  context.read<CubitForPending>().loadPendingBookings();
}

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitForPending, StateForPending>(
      listener: (context, state) {
        if (state is PendingBookingLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Pending bookings loaded successfully")),
          );
        } else if (state is PendingBookingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 170),
                child: Text(
                  "Your Apartments",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<CubitForPending, StateForPending>(
                builder: (context, state) {
                  if (state is PendingBookingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PendingBookingFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  } else if (state is PendingBookingLoaded) {
                    final apartments = state.bookings;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: apartments.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        return Container(
                          height: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 20,
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    apartment.outdoor_image,
                                    height: 220,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      apartment.apartment_title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${apartment.start_date} → ${apartment.end_date}",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Price: \$${apartment.total_price.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Status: ${apartment.status}",
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}*/

/*class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  void initState() {
    super.initState();
    // Load pending bookings when page opens
    context.read<CubitForPending>().loadPendingBookings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitForPending, StateForPending>(
      builder: (context, state) {
        if (state is PendingBookingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PendingBookingFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        } else if (state is PendingBookingLoaded) {
          final bookings = state.bookings;
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
          
            itemCount: bookings.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        booking.outdoor_image,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking.apartment_title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${booking.start_date} → ${booking.end_date}",
                            style: const TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Price: \$${booking.total_price.toStringAsFixed(2)}",
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Status: ${booking.status}",
                            style: const TextStyle(color: Colors.blue, fontSize: 16),
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
    );
  }
}
*/
/*class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // جلب الحجوزات المعلقة عند بناء الصفحة
    context.read<CubitForPending>().getOwner();

    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 170),
              child: Text(
                "Pending Bookings",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<CubitForPending, StateForPending>(
              builder: (context, state) {
                if (state is PendingBookingLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is PendingBookingFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }
                if (state is PendingBookingLoaded) {
                  final bookings = state.bookings;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bookings.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      return Container(
                        height: 700,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade900,
                              blurRadius: 20,
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  booking.outdoor_image,
                                  height: 220,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking.apartment_title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${booking.start_date} → ${booking.end_date}",
                                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Price: \$${booking.total_price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Color(0xff7eaf96),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Status: ${booking.status}",
                                    style: const TextStyle(color: Colors.blue, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  if (booking.status == "pending")
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<OwnerBookingCubit>()
                                                .confirmBooking(booking.id);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                          child: const Text("Approve"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<OwnerBookingCubit>()
                                                .rejectBooking(booking.id);
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
          ],
        ),
      ),
    );
  }
}
*/

class PendingBookingsScreen extends StatelessWidget {
  const PendingBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerBookingCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        appBar: AppBar(
          backgroundColor: const Color(0xff7eaf96),
          elevation: 0,
          title: const Text("Pending Bookings"),
        ),
        body: BlocBuilder<OwnerBookingCubit, OwnerBookingState>(
          builder: (context, state) {
            if (state is OwnerBookingLoading ) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is OwnerBookingFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is OwnerBookingLoaded) {
              final bookings = state.bookings;

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
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            booking.outdoor_image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking.apartment_title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${booking.start_date} → ${booking.end_date}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Price: \$${booking.total_price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Status: ${booking.status}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: booking.status == "pending"
                                      ? Colors.orange
                                      : booking.status == "approved"
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (booking.status == "pending")
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        print("UI booking id = ${booking.id}"); // 👈 لازم يطبع رقم صح
                                        context.read<OwnerBookingCubit>().confirmBooking(booking.id);
                                        // context.read<OwnerBookingCubit>().confirmBooking(booking.id);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      child: const Text("Approve"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                       
                                         context.read<OwnerBookingCubit>().rejectBooking(booking.id );
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
