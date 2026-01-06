import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:home_boom_app/Booking/presentation/manage/cubit_for_Booking.dart';
import 'package:home_boom_app/Booking/presentation/manage/state_for_Booking.dart';
import 'package:home_boom_app/MyBooking/presentation/manage/cubit_mybooking.dart';
import 'package:home_boom_app/MyBooking/presentation/manage/cubit_rate.dart';
import 'package:home_boom_app/MyBooking/presentation/manage/state_mybooking.dart'
    hide BookingcancelFauiler, BookingcancelSuccess;
import 'package:home_boom_app/MyBooking/presentation/manage/state_rate.dart';

/*class MyBookingsPage extends StatelessWidget {
  final int userId;
  final String token;

  const MyBookingsPage({super.key, required this.userId, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitMybooking()..getMyBookings(userId, token),
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        appBar: AppBar(
          backgroundColor: const Color(0xff7eaf96),
          elevation: 0,
          title: const Text("My Bookings"),
          centerTitle: true,
        ),
        body: BlocBuilder<CubitMybooking, StateMybooking>(
          builder: (context, state) {
            if (state is MyBookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MyBookingFauiler) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is MyBookingSuccess) {
              final bookings = state.mybookings;

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: bookings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final booking = bookings[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ApartmentDetails(apartmentId: booking.booking_id,);
                      }));
                    },
                    child: Container(
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
                          // صورة الشقة
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(
                              booking.outdoor_image,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 220,
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                alignment: Alignment.center,
                                child: const Icon(Icons.home, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                    
                          // معلومات الحجز
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // عنوان الشقة
                                Text(
                                  booking.apartment_title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                    
                    
                    
                                // التاريخ
                                Text(
                                  "${booking.start_date} → ${booking.end_date}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 6),
                    
                                // السعر
                                Text(
                                  "\$${booking.total_price.toStringAsFixed(0)} ",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                    
                                // حالة الحجز مع لون
                                           Row(
                                    children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: (booking.status == "pending"
                                ? Colors.orange
                                : booking.status == "accepted"
                                    ? Colors.green
                                    : booking.status == "rejected"
                                        ? Colors.red
                                        : Colors.blueGrey
                              ).withOpacity(.15),
                      ),
                      child: Text(
                        booking.status,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: (booking.status == "pending"
                                  ? Colors.orange
                                  : booking.status == "accepted"
                                      ? Colors.green
                                      : booking.status == "rejected"
                                          ? Colors.red
                                          : Colors.blueGrey
                          ),
                        ),
                      ),
                    ),
                                    ],
                                  ),
                              ],
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
      ),
    );
  }
}*/

/*class MyBookingsPage extends StatelessWidget {
  final int userId;
  final String token;

  const MyBookingsPage({super.key, required this.userId, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitMybooking()..getMyBookings(userId, token),
      child: BlocListener<CubitMybooking, StateMybooking>(
        listener: (context, state) {
          if (state is MyBookingUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Booking updated successfully")),
            );
            // تحديث الـ list بعد التعديل
            context.read<CubitMybooking>().getMyBookings(userId, token);
          } else if (state is MyBookingFauiler) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xff7eaf96),
          appBar: AppBar(
            backgroundColor: const Color(0xff7eaf96),
            elevation: 0,
            title: const Text("My Bookings"),
            centerTitle: true,
          ),
          body: BlocBuilder<CubitMybooking, StateMybooking>(
            builder: (context, state) {
              if (state is MyBookingLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MyBookingFauiler) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is MyBookingSuccess) {
                final bookings = state.mybookings;

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: bookings.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];

                    return InkWell(
                      onTap: () {
                        // تعديل التواريخ
                        DateTime start = DateTime.parse(booking.start_date);
                        DateTime end = DateTime.parse(booking.end_date);
                        int totalDays = booking.total_days;
                        double totalPrice = booking.total_price;

                        showDialog(
                          context: context,
                          builder: (_) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text("Edit Booking Dates"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text("Start Date: ${start.toLocal()}".split(' ')[0]),
                                        trailing: const Icon(Icons.calendar_today),
                                        onTap: () async {
                                          DateTime? picked = await showDatePicker(
                                            context: context,
                                            initialDate: start,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (picked != null && picked != start) {
                                            setState(() {
                                              start = picked;
                                              totalDays = end.difference(start).inDays;
                                              if (totalDays < 1) totalDays = 1;
                                              totalPrice = totalDays * (booking.total_price / booking.total_days);
                                            });
                                          }
                                        },
                                      ),
                                      ListTile(
                                        title: Text("End Date: ${end.toLocal()}".split(' ')[0]),
                                        trailing: const Icon(Icons.calendar_today),
                                        onTap: () async {
                                          DateTime? picked = await showDatePicker(
                                            context: context,
                                            initialDate: end,
                                            firstDate: start.add(const Duration(days: 1)),
                                            lastDate: DateTime(2100),
                                          );
                                          if (picked != null && picked != end) {
                                            setState(() {
                                              end = picked;
                                              totalDays = end.difference(start).inDays;
                                              if (totalDays < 1) totalDays = 1;
                                              totalPrice = totalDays * (booking.total_price / booking.total_days);
                                            });
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Total Days: $totalDays"),
                                      Text("Total Price: \$${totalPrice.toStringAsFixed(0)}"),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<CubitForBooking>().updateBooking(
                                          token,
                                          userId,
                                          booking.booking_id,
                                          start.toIso8601String().split('T')[0],
                                          end.toIso8601String().split('T')[0],
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Save"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
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
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  height: 220,
                                  width: double.infinity,
                                  color: Colors.grey.shade300,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.home, size: 50, color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking.apartment_title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${booking.start_date} → ${booking.end_date}",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${booking.total_price.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Text(
                                        "Status: ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: (booking.status == "pending"
                                                  ? Colors.orange
                                                  : booking.status == "accepted"
                                                      ? Colors.green
                                                      : booking.status == "rejected"
                                                          ? Colors.red
                                                          : Colors.blueGrey
                                                ).withOpacity(.15),
                                        ),
                                        child: Text(
                                          booking.status,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: (booking.status == "pending"
                                                    ? Colors.orange
                                                    : booking.status == "accepted"
                                                        ? Colors.green
                                                        : booking.status == "rejected"
                                                            ? Colors.red
                                                            : Colors.blueGrey
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
*/

/*class MyBookingsPage extends StatelessWidget {
  final int userId;
  final String token;

  const MyBookingsPage({super.key, required this.userId, required this.token});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CubitMybooking()..getMyBookings(userId, token),
        ),
        BlocProvider(
          create: (_) => CubitForBooking(),
        ),
      ],
      child: BlocListener<CubitForBooking, StateForBooking>(
        listener: (context, state) {
          if (state is BookingUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Booking updated successfully")),
            );
            context.read<CubitMybooking>().getMyBookings(userId, token);
          } else if (state is BookingUpdateFauiler) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xff7eaf96),
          appBar: AppBar(
            backgroundColor: const Color(0xff7eaf96),
            elevation: 0,
            title: const Text("My Bookings"),
            centerTitle: true,
          ),
          body: BlocBuilder<CubitMybooking, StateMybooking>(
            builder: (context, state) {
              if (state is MyBookingLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MyBookingFauiler) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is MyBookingSuccess) {
                final bookings = state.mybookings;

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: bookings.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    TextEditingController startController = TextEditingController(text: booking.start_date);
                    TextEditingController endController = TextEditingController(text: booking.end_date);

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
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 220,
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                alignment: Alignment.center,
                                child: const Icon(Icons.home, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.apartment_title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${booking.start_date} → ${booking.end_date}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "\$${booking.total_price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Status: ",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: (booking.status == "pending"
                                                    ? Colors.orange
                                                    : booking.status == "accepted"
                                                        ? Colors.green
                                                        : booking.status == "rejected"
                                                            ? Colors.red
                                                            : Colors.blueGrey
                                                  ).withOpacity(.15),
                                          ),
                                          child: Text(
                                            booking.status,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: (booking.status == "pending"
                                                      ? Colors.orange
                                                      : booking.status == "accepted"
                                                          ? Colors.green
                                                          : booking.status == "rejected"
                                                              ? Colors.red
                                                              : Colors.blueGrey
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text("Edit Booking"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: startController,
                                                  decoration: const InputDecoration(labelText: "Start Date (YYYY-MM-DD)"),
                                                ),
                                                TextField(
                                                  controller: endController,
                                                  decoration: const InputDecoration(labelText: "End Date (YYYY-MM-DD)"),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text("Cancel"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  context.read<CubitForBooking>().updateBooking(
                                                    token,
                                                    userId,
                                                    booking.booking_id,
                                                    startController.text,
                                                    endController.text,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Save"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                      label: const Text("Edit"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff7eaf96),
                                      ),
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
      ),
    );
  }}*/

/*class MyBookingsPage extends StatelessWidget {
  final int userId;
  final String token;

  const MyBookingsPage({super.key, required this.userId, required this.token});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CubitMybooking()..getMyBookings(userId, token),
        ),
        BlocProvider(create: (_) => CubitForBooking()),
      ],
      child: BlocListener<CubitForBooking, StateForBooking>(
        listener: (context, state) {
          if (state is BookingUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Booking updated successfully")),
            );
            context.read<CubitMybooking>().getMyBookings(userId, token);
          } else if (state is BookingUpdateFauiler) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is BookingcancelSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Booking cancelled successfully")),
            );
            context.read<CubitMybooking>().getMyBookings(userId, token);
          } else if (state is BookingcancelFauiler) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xff7eaf96),
          appBar: AppBar(
            backgroundColor: const Color(0xff7eaf96),
            elevation: 0,
            title: const Text("My Bookings"),
            centerTitle: true,
          ),
          body: BlocBuilder<CubitMybooking, StateMybooking>(
            builder: (context, state) {
              if (state is MyBookingLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MyBookingFauiler) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is MyBookingSuccess) {
                final bookings = state.mybookings;

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: bookings.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    TextEditingController startController =
                        TextEditingController(text: booking.start_date);
                    TextEditingController endController = TextEditingController(
                      text: booking.end_date,
                    );

                    return Container(
                      height: 450,
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
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.network(
                              booking.outdoor_image,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 220,
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.home,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.apartment_title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${booking.start_date} → ${booking.end_date}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "\$${booking.total_price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // حالة الحجز
                                    Row(
                                      children: [
                                        const Text(
                                          "Status: ",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            color:
                                                (booking.status == "pending"
                                                        ? Colors.orange
                                                        : booking.status ==
                                                              "accepted"
                                                        ? Colors.green
                                                        : booking.status ==
                                                              "rejected"
                                                        ? Colors.red
                                                        : Colors.blueGrey)
                                                    .withOpacity(.15),
                                          ),
                                          child: Text(
                                            booking.status,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  (booking.status == "pending"
                                                  ? Colors.orange
                                                  : booking.status == "accepted"
                                                  ? Colors.green
                                                  : booking.status == "rejected"
                                                  ? Colors.red
                                                  : Colors.blueGrey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // أزرار التعديل والإلغاء
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // زر التعديل
                              ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Edit Booking"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: startController,
                                            decoration: const InputDecoration(
                                              labelText:
                                                  "Start Date (YYYY-MM-DD)",
                                            ),
                                          ),
                                          TextField(
                                            controller: endController,
                                            decoration: const InputDecoration(
                                              labelText:
                                                  "End Date (YYYY-MM-DD)",
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<CubitForBooking>()
                                                .updateBooking(
                                                  token,
                                                  userId,
                                                  booking.booking_id,
                                                  startController.text,
                                                  endController.text,
                                                );
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Save"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                                label: const Text("Edit"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff7eaf96),
                                ),
                              ),

                              const SizedBox(width: 10),

                              // زر الإلغاء
                              ElevatedButton.icon(
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Cancel Booking"),
                                      content: const Text(
                                        "Are you sure you want to cancel this booking?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text("No"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirm == true) {
                                    context
                                        .read<CubitForBooking>()
                                        .cancelBooking(
                                          token,
                                          userId,
                                          booking.booking_id,
                                        );
                                  }
                                },
                                icon: const Icon(Icons.cancel),
                                label: const Text("Cancel"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
*/

// class MyBookingsPage extends StatelessWidget {
//   final int userId;
//   final String token;

//   const MyBookingsPage({
//     super.key,
//     required this.userId,
//     required this.token,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => CubitMybooking()..getMyBookings(userId, token),
//         ),
//         BlocProvider(
//           create: (_) => CubitForBooking(),
//         ),
//       ],
//       child: BlocListener<CubitForBooking, StateForBooking>(
//         listener: (context, state) {
//           if (state is BookingcancelSuccess ||
//               state is BookingUpdateSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                   state is BookingcancelSuccess
//                       ? state.message
//                       : "Booking updated successfully",
//                 ),
//               ),
//             );

//             /// 🔥 إعادة تحميل الحجوزات
//             context.read<CubitMybooking>().getMyBookings(userId, token);
//           }

//           if (state is BookingcancelFauiler  ) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//           if (state is BookingUpdateFauiler) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         child: Scaffold(
//           backgroundColor: const Color(0xff7eaf96),
//           appBar: AppBar(
//             backgroundColor: const Color(0xff7eaf96),
//             elevation: 0,
//             title: const Text("My Bookings"),
//             centerTitle: true,
//           ),
//           body: BlocBuilder<CubitMybooking, StateMybooking>(
//             builder: (context, state) {
//               if (state is MyBookingLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (state is MyBookingFauiler) {
//                 return Center(
//                   child: Text(
//                     state.message,
//                     style: const TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 );
//               }

//               if (state is MyBookingSuccess) {
//                 final bookings = state.mybookings;

//                 if (bookings.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       "No bookings found",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   padding: const EdgeInsets.all(12),
//                   itemCount: bookings.length,
//                   itemBuilder: (context, index) {
//                     final booking = bookings[index];

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.15),
//                             blurRadius: 6,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           /// image
//                           ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(16),
//                             ),
//                             child: Image.network(
//                               booking.outdoor_image,
//                               height: 200,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.all(14),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 /// title
//                                 Text(
//                                   booking.apartment_title,
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),

//                                 const SizedBox(height: 6),

//                                 /// dates
//                                 Text(
//                                   "${booking.start_date} → ${booking.end_date}",
//                                   style: const TextStyle(fontSize: 16),
//                                 ),

//                                 const SizedBox(height: 6),

//                                 /// price
//                                 Text(
//                                   "\$${booking.total_price}",
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),

//                                 const SizedBox(height: 10),

//                                 /// status
//                                 Row(
//                                   children: [
//                                     const Text(
//                                       "Status: ",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 6,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color: booking.status == 'pending'
//                                             ? Colors.orange.withOpacity(.2)
//                                             : booking.status == 'confirmed'
//                                                 ? Colors.green.withOpacity(.2)
//                                                 : booking.status == 'updating'
//                                                     ? Colors.blue.withOpacity(.2)
//                                                     : Colors.grey.withOpacity(.2),
//                                       ),
//                                       child: Text(
//                                         booking.status,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: booking.status == 'pending'
//                                               ? Colors.orange
//                                               : booking.status == 'confirmed'
//                                                   ? Colors.green
//                                                   : booking.status == 'updating'
//                                                       ? Colors.blue
//                                                       : Colors.grey,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),

//                                 const SizedBox(height: 14),

//                                 /// buttons
//                                 Row(
//                                   children: [
//                                     /// ✏️ Edit (فقط pending & updating)
//                                       if (booking.status != 'rejected')
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor:
//                                                 const Color(0xff7eaf96),
//                                           ),
//                                           onPressed: () {
//                                             final startController =
//                                                 TextEditingController(
//                                                     text: booking.start_date);
//                                             final endController =
//                                                 TextEditingController(
//                                                     text: booking.end_date);

//                                             showDialog(
//                                               context: context,
//                                               builder: (_) => AlertDialog(
//                                                 title:
//                                                     const Text("Edit Booking"),
//                                                 content: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   children: [
//                                                     TextField(
//                                                       controller:
//                                                           startController,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                         labelText:
//                                                             "Start Date",
//                                                       ),
//                                                     ),
//                                                     TextField(
//                                                       controller:
//                                                           endController,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                         labelText: "End Date",
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child:
//                                                         const Text("Cancel"),
//                                                   ),
//                                                   ElevatedButton(
//                                                     onPressed: () {
//                                                       context
//                                                           .read<
//                                                               CubitForBooking>()
//                                                           .updateBooking(
//                                                             token,
//                                                             userId,
//                                                             booking.booking_id,
//                                                             startController
//                                                                 .text,
//                                                             endController.text,
//                                                           );
//                                                       Navigator.pop(context);
//                                                     },
//                                                     child: const Text("Save"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                           child: const Text("Edit"),
//                                         ),
//                                       ),

//                                     if (booking.status != 'rejected')
//                                       const SizedBox(width: 10),

//                                     /// ❌ Cancel
//                                      if (booking.status != 'rejected')
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.red,
//                                           ),
//                                           onPressed: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (_) => AlertDialog(
//                                                 title: const Text(
//                                                     "Cancel Booking"),
//                                                 content: const Text(
//                                                     "Are you sure you want to cancel this booking?"),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: const Text("No"),
//                                                   ),
//                                                   ElevatedButton(
//                                                     style: ElevatedButton
//                                                         .styleFrom(
//                                                       backgroundColor:
//                                                           Colors.red,
//                                                     ),
//                                                     onPressed: () {
//                                                       Navigator.pop(context);
//                                                       context
//                                                           .read<
//                                                               CubitForBooking>()
//                                                           .cancelBooking(
//                                                             token,
//                                                             userId,
//                                                             booking.booking_id,
//                                                           );
//                                                     },
//                                                     child:
//                                                         const Text("Yes, Cancel"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                           child: const Text("Cancel"),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }

//               return const SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MyBookingsPage extends StatelessWidget {
//   final int userId;
//   final String token;

//   const MyBookingsPage({super.key, required this.userId, required this.token});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => CubitMybooking()..getMyBookings(userId, token),
//         ),
//         BlocProvider(create: (_) => CubitForBooking()),
//       ],
//       child: BlocListener<CubitForBooking, StateForBooking>(
//         listener: (context, state) {
//           if (state is BookingcancelSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text(" Booking cancel successfully")),
//             );

//             /// نعيد جلب الحجوزات
//             context.read<CubitMybooking>().getMyBookings(userId, token);
//           }
//           if (state is BookingUpdateSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text(
//                   "Update sent successfully. Waiting for owner approval",
//                 ),
//               ),
//             );

//             /// نعيد جلب الحجوزات
//             context.read<CubitMybooking>().getMyBookings(userId, token);
//           }

//           if (state is BookingcancelFauiler) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.message)));
//           }
//           if (state is BookingUpdateFauiler) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.message)));
//           }
//         },
//         child: Scaffold(
//           backgroundColor: const Color(0xff7eaf96),
//           appBar: AppBar(
//             backgroundColor: const Color(0xff7eaf96),
//             elevation: 0,
//             title: const Text("My Bookings"),
//             centerTitle: true,
//           ),
//           body: BlocBuilder<CubitMybooking, StateMybooking>(
//             builder: (context, state) {
//               if (state is MyBookingLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (state is MyBookingFauiler) {
//                 return Center(
//                   child: Text(
//                     state.message,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 );
//               }

//               if (state is MyBookingSuccess) {
//                 final bookings = state.mybookings;

//                 if (bookings.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       "No bookings found",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   padding: const EdgeInsets.all(12),
//                   itemCount: bookings.length,
//                   itemBuilder: (context, index) {
//                     final booking = bookings[index];

//                     final canEditOrCancel =
//                         booking.status == 'pending' ||
//                         booking.status == 'confirmed';

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(.15),
//                             blurRadius: 6,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           /// image
//                           ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(16),
//                             ),
//                             child: Image.network(
//                               booking.outdoor_image,
//                               height: 200,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.all(14),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 /// title
//                                 Text(
//                                   booking.apartment_title,
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),

//                                 const SizedBox(height: 6),

//                                 /// dates
//                                 Text(
//                                   "${booking.start_date} → ${booking.end_date}",
//                                   style: const TextStyle(fontSize: 16),
//                                 ),

//                                 const SizedBox(height: 6),

//                                 /// price
//                                 Text(
//                                   "\$${booking.total_price}",
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),

//                                 const SizedBox(height: 10),

//                                 /// status
//                                 Row(
//                                   children: [
//                                     const Text(
//                                       "Status: ",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 6,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color: booking.status == 'pending'
//                                             ? Colors.orange.withOpacity(.2)
//                                             : booking.status == 'confirmed'
//                                             ? Colors.green.withOpacity(.2)
//                                             : booking.status == 'rejected'
//                                             ? Colors.red.withOpacity(.2)
//                                             : Colors.grey.withOpacity(.2),
//                                       ),
//                                       child: Text(
//                                         booking.status,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: booking.status == 'pending'
//                                               ? Colors.orange
//                                               : booking.status == 'confirmed'
//                                               ? Colors.green
//                                               : booking.status == 'rejected'
//                                               ? Colors.red
//                                               : Colors.grey,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 if (booking.status == 'updating')
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 8),
//                                     child: Text(
//                                       "Your update request is pending owner approval",
//                                       style: TextStyle(
//                                         color: Colors.orange,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),

//                                 const SizedBox(height: 14),

//                                 /// buttons
//                                 if (canEditOrCancel)
//                                   Row(
//                                     children: [
//                                       /// Edit
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: const Color(
//                                               0xff7eaf96,
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             final startController =
//                                                 TextEditingController(
//                                                   text: booking.start_date,
//                                                 );
//                                             final endController =
//                                                 TextEditingController(
//                                                   text: booking.end_date,
//                                                 );

//                                             showDialog(
//                                               context: context,
//                                               builder: (_) => AlertDialog(
//                                                 title: const Text(
//                                                   "Edit Booking",
//                                                 ),
//                                                 content: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   children: [
//                                                     TextField(
//                                                       controller:
//                                                           startController,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                             labelText:
//                                                                 "Start Date",
//                                                             hintText:
//                                                                 "YYYY-MM-DD",
//                                                           ),
//                                                     ),
//                                                     TextField(
//                                                       controller: endController,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                             labelText:
//                                                                 "End Date",
//                                                             hintText:
//                                                                 "YYYY-MM-DD",
//                                                           ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: const Text("Cancel"),
//                                                   ),
//                                                   ElevatedButton(
//                                                     onPressed: () {
//                                                       context
//                                                           .read<
//                                                             CubitForBooking
//                                                           >()
//                                                           .updateBooking(
//                                                             token,
//                                                             userId,
//                                                             booking.booking_id,
//                                                             startController
//                                                                 .text,
//                                                             endController.text,
//                                                           );
//                                                       Navigator.pop(context);
//                                                     },
//                                                     child: const Text("Save"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                           child: const Text("Edit"),
//                                         ),
//                                       ),

//                                       const SizedBox(width: 10),

//                                       /// Cancel
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.red,
//                                           ),
//                                           onPressed: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (_) => AlertDialog(
//                                                 title: const Text(
//                                                   "Cancel Booking",
//                                                 ),
//                                                 content: const Text(
//                                                   "Are you sure?",
//                                                 ),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: const Text("No"),
//                                                   ),
//                                                   ElevatedButton(
//                                                     style:
//                                                         ElevatedButton.styleFrom(
//                                                           backgroundColor:
//                                                               Colors.red,
//                                                         ),
//                                                     onPressed: () {
//                                                       Navigator.pop(context);
//                                                       context
//                                                           .read<
//                                                             CubitForBooking
//                                                           >()
//                                                           .cancelBooking(
//                                                             token,
//                                                             userId,
//                                                             booking.booking_id,
//                                                           );
//                                                     },
//                                                     child: const Text(
//                                                       "Yes, Cancel",
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                           child: const Text("Cancel"),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }

//               return const SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyBookingsPage extends StatelessWidget {
  final int userId;
  final String token;

  const MyBookingsPage({
    super.key,
    required this.userId,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CubitMybooking()..getMyBookings(userId, token),
        ),
        BlocProvider(create: (_) => CubitForBooking()),
        BlocProvider(create: (_) => CubitBookingRating()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CubitBookingRating, RateBookingState>(
            listener: (context, state) {
              if (state is RateBookingSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم إرسال التقييم بنجاح")),
                );
              }

              if (state is RateBookingFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<CubitForBooking, StateForBooking>(
            listener: (context, state) {
              if (state is BookingcancelSuccess ||
                  state is BookingUpdateSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state is BookingcancelSuccess
                          ? "Booking cancel successfully"
                          : "Update sent successfully. Waiting for owner approval",
                    ),
                  ),
                );
                context.read<CubitMybooking>().getMyBookings(userId, token);
              }

              if (
                  state is BookingUpdateFauiler) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
              if (state is BookingcancelFauiler 
                  ) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: const Color(0xff7eaf96),
          appBar: AppBar(
            backgroundColor: const Color(0xff7eaf96),
            elevation: 0,
            title: const Text("My Bookings"),
            centerTitle: true,
          ),
          body: BlocBuilder<CubitMybooking, StateMybooking>(
            builder: (context, state) {
              if (state is MyBookingLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MyBookingFauiler) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }

              if (state is MyBookingSuccess) {
                final bookings = state.mybookings;

                if (bookings.isEmpty) {
                  return const Center(
                    child: Text(
                      "No bookings found",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];

                    final canEditOrCancel = booking.status == 'pending' ||
                        booking.status == 'confirmed';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.15),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.apartment_title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "${booking.start_date} → ${booking.end_date}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "\$${booking.total_price}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      "Status: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: booking.status == 'pending'
                                            ? Colors.orange.withOpacity(.2)
                                            : booking.status == 'confirmed'
                                                ? Colors.green.withOpacity(.2)
                                                : booking.status == 'rejected'
                                                    ? Colors.red.withOpacity(.2)
                                                    : Colors.grey.withOpacity(.2),
                                      ),
                                      child: Text(
                                        booking.status,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: booking.status == 'pending'
                                              ? Colors.orange
                                              : booking.status ==
                                                      'confirmed'
                                                  ? Colors.green
                                                  : booking.status ==
                                                          'rejected'
                                                      ? Colors.red
                                                      : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                if (canEditOrCancel)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff7eaf96),
                                          ),
                                          onPressed: () {},
                                          child: const Text("Edit"),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {},
                                          child: const Text("Cancel"),
                                        ),
                                      ),
                                    ],
                                  ),

                                /// ⭐ النجوم التفاعلية
                                if (booking.status == 'confirmed')
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: RatingBar.builder(
                                      initialRating:
                                          booking.rating != null
                                              ? booking.rating! / 20
                                              : 0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        double backendRating = rating * 20;
                                        context
                                            .read<CubitBookingRating>()
                                            .rateBooking(
                                              userId: userId,
                                              bookingId:
                                                  booking.booking_id,
                                              rating: backendRating,
                                              token: token,
                                            )
                                            .then((_) {
                                          // تحديث مباشر في UI بدون انتظار getMyBookings
                                          booking.rating = backendRating;
                                        });
                                      },
                                    ),
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
      ),
    );
  }
}