import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/cubit_apartment%20_specifications.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/state_apartment%20_specifications.dart';
import 'package:home_boom_app/Booking/presentation/manage/cubit_for_Booking.dart';
import 'package:home_boom_app/Booking/presentation/manage/state_for_Booking.dart';
import 'package:home_boom_app/Booking/presentation/views/pending.dart';
import 'package:home_boom_app/shard.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class ApartmentDetails extends StatefulWidget {
  final int apartmentId;
  const ApartmentDetails({super.key, required this.apartmentId});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  int currentIndex = 0;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    print("Apartment ID sent to API: ${widget.apartmentId}");
    context.read<CubitApartmentSpecifications>().getApartmentById(
      widget.apartmentId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child:
            BlocBuilder<
              CubitApartmentSpecifications,
              StateApartmentSpecifications
            >(
              builder: (context, state) {
                if (state is ApartmentSpecificationsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ApartmentSpecificationsFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }

                if (state is ApartmentSpecificationsSuccess) {
                 final apartment = state.apartments;

  // 🔴 تعديل 1: حماية الصور
  final List<String> images =
      state.apartments.images;
         
                  return Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,

                        child: PageView.builder(
                          itemCount: images.length,
                          onPageChanged: (index) =>
                              setState(() => currentIndex = index),
                          itemBuilder: (context, index) => Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            
                          ),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 450),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff7eaf96),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  images.length,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    width: currentIndex == index ? 12 : 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    apartment.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),

                                
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Color(0xFFA6C900),
                                          size: 22,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          apartment.location,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.layers,
                                          color: Color(0xFFA6C900),
                                          size: 22,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          apartment.area.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            Text(
                              apartment.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 30),

                            Row(
                              children: [
                                infoBox(Icons.bed, apartment.rooms.toString()),
                                const SizedBox(width: 12),
                                infoBox(Icons.bathtub, "1 Bathroom"),
                              ],
                            ),

                            const SizedBox(height: 40),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                 " \$${apartment.price.toString()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: pickDatesAndCheckAvailability,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    "Check Availability",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
      ),
    );
  }

  Widget infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Future<void> pickDatesAndCheckAvailability() async {
    final pickedStart = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedStart == null) return;
    final pickedEnd = await showDatePicker(
      context: context,
      initialDate: pickedStart.add(const Duration(days: 1)),
      firstDate: pickedStart.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedEnd == null) return;
    setState(() {
      startDate = pickedStart;
      endDate = pickedEnd;
    });
    final isAvailable = checkAvailabilityMock();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isAvailable ? Colors.green : Colors.red,
        content: Text(
          isAvailable ? "✅ التواريخ متاحة" : "❌ عذراً، التواريخ محجوزة",
          style: const TextStyle(fontSize: 16),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  bool checkAvailabilityMock() => startDate!.day % 2 == 0;
}*/

/*class ApartmentDetails extends StatefulWidget {
  final int apartmentId;
  const ApartmentDetails({super.key, required this.apartmentId});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  int currentIndex = 0;
  DateTime? startDate;
  DateTime? endDate;
  String? userToken;
  int? user_id;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    context.read<CubitApartmentSpecifications>().getApartmentById(
      widget.apartmentId,
    );
  }

  Future<void> _loadUserData() async {
    userToken = await getToken();
    user_id = await getUserId();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitForBooking, StateForBooking>(
      listener: (context, state) {
        if (state is BookingLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⏳ جاري الحجز..."),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 1),
        ),
      );
    }

    if (state is BookingSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("🎉 تم الحجز بنجاح!"),
          backgroundColor: Colors.green,
        ),
      );
    }

    if (state is BookingFauiler) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ فشل الحجز: ${state.message}"),
          backgroundColor: Colors.red,
        ),
      );
    }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        body: SingleChildScrollView(
          child:
              BlocBuilder<
                CubitApartmentSpecifications,
                StateApartmentSpecifications
              >(
                builder: (context, state) {
                  if (state is ApartmentSpecificationsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ApartmentSpecificationsFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }

                  if (state is ApartmentSpecificationsSuccess) {
                    final apartment = state.apartments;
                    final images = apartment.images;

                    return Stack(
                      children: [
                        SizedBox(
                          height: 500,
                          width: double.infinity,
                          child: PageView.builder(
                            itemCount: images.length,
                            onPageChanged: (index) =>
                                setState(() => currentIndex = index),
                            itemBuilder: (context, index) =>
                                Image.network(images[index], fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 450),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xff7eaf96),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    images.length,
                                    (index) => Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      width: currentIndex == index ? 12 : 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      apartment.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xFFA6C900),
                                            size: 22,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            apartment.location,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.layers,
                                            color: Color(0xFFA6C900),
                                            size: 22,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            apartment.area.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                apartment.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  infoBox(
                                    Icons.bed,
                                    apartment.rooms.toString(),
                                  ),
                                  const SizedBox(width: 12),
                                  infoBox(Icons.bathtub, "1 Bathroom"),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${apartment.price}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: pickDatesAndBook,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                        // BlocConsumer للحجز
                        BlocConsumer<CubitForBooking, StateForBooking>(
                          listener: (context, state) {
                            if (state is BookingLoading) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("⏳ جاري معالجة الحجز..."),
                                  backgroundColor: Colors.blue,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else if (state is BookingSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "✅ تم الحجز بنجاح! المبلغ: \$${state.booking.total_price}",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else if (state is BookingFauiler) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "❌ فشل الحجز: ${state.message}",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return const SizedBox(); // لا نحتاج لعرض شيء هنا
                          },
                        ),
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),
        ),
      ),
    );
  }

  Widget infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Future<void> pickDatesAndBook() async {
    final pickedStart = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedStart == null) return;

    final pickedEnd = await showDatePicker(
      context: context,
      initialDate: pickedStart.add(const Duration(days: 1)),
      firstDate: pickedStart.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedEnd == null) return;

    setState(() {
      startDate = pickedStart;
      endDate = pickedEnd;
    });

    // جلب token وuserId
    final token = await getToken();
    final userId = await getUserId();

    if (token == null || userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ خطأ: لم يتم العثور على بيانات المستخدم"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else {
      print(" Token & UserId موجودين وتم جلبهم بنجاح");
    }

    // إرسال الحجز عبر CubitForBooking
    context.read<CubitForBooking>().storeBooking(
      token,
      userId,
      widget.apartmentId,
      startDate!.toIso8601String().split('T')[0],
      endDate!.toIso8601String().split('T')[0],
    );
  }
}
*/

/*class ApartmentDetails extends StatefulWidget {
  final int apartmentId;
  const ApartmentDetails({super.key, required this.apartmentId});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  int currentIndex = 0;
  DateTime? startDate;
  DateTime? endDate;
  String? userToken;
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    context.read<CubitApartmentSpecifications>().getApartmentById(widget.apartmentId);
  }

  Future<void> _loadUserData() async {
    userToken = await getToken();
    userId = await getUserId();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitForBooking, StateForBooking>(
      listener: (context, state) {
    if (state is BookingSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم إرسال طلب الحجز بانتظار موافقة المالك")),
      );
    } else if (state is BookingFauiler) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ فشل الحجز: ${state.message}")),
      );
    }
  },
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        body: SingleChildScrollView(
          child: BlocBuilder<CubitApartmentSpecifications, StateApartmentSpecifications>(
            builder: (context, state) {
              if (state is ApartmentSpecificationsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ApartmentSpecificationsFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              } else if (state is ApartmentSpecificationsSuccess) {
                final apartment = state.apartments;
                final images = apartment.images;

                return Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) => setState(() => currentIndex = index),
                        itemBuilder: (context, index) => Image.network(images[index], fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                          ),
                          const Icon(Icons.bookmark_border, color: Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 450),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff7eaf96),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                images.length,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  width: currentIndex == index ? 12 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index ? Colors.white : Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  apartment.title,
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Color(0xFFA6C900), size: 22),
                                      const SizedBox(width: 5),
                                      Text(apartment.location, style: const TextStyle(color: Colors.white, fontSize: 18)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.layers, color: Color(0xFFA6C900), size: 22),
                                      const SizedBox(width: 5),
                                      Text(apartment.area.toString(), style: const TextStyle(color: Colors.white, fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            apartment.description,
                            style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              infoBox(Icons.bed, apartment.rooms.toString()),
                              const SizedBox(width: 12),
                              infoBox(Icons.bathtub, "1 Bathroom"),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${apartment.price}",
                                style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: pickDatesAndConfirmDialog,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Future<void> pickDatesAndConfirmDialog() async {
    final pickedStart = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedStart == null) return;

    final pickedEnd = await showDatePicker(
      context: context,
      initialDate: pickedStart.add(const Duration(days: 1)),
      firstDate: pickedStart.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedEnd == null) return;

    setState(() {
      startDate = pickedStart;
      endDate = pickedEnd;
    });

    final totalDays = endDate!.difference(startDate!).inDays;
    final apartmentPrice = context.read<CubitApartmentSpecifications>().state is ApartmentSpecificationsSuccess
        ? (context.read<CubitApartmentSpecifications>().state as ApartmentSpecificationsSuccess).apartments.price
        : 0;
    final totalPrice = totalDays * apartmentPrice;

    // عرض Dialog لتأكيد الحجز
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تأكيد الحجز"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("تاريخ البداية: ${startDate!.toLocal().toString().split(' ')[0]}"),
            Text("تاريخ النهاية: ${endDate!.toLocal().toString().split(' ')[0]}"),
            Text("عدد الأيام: $totalDays"),
            Text("السعر الإجمالي: \$${totalPrice.toStringAsFixed(2)}"),
            const SizedBox(height: 10),
            const Text("حالة الحجز: Pending (بانتظار موافقة المالك)"),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PendingBookingsScreen();
              }));
            },

            child: ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                if (userToken == null || userId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("❌ خطأ: لم يتم العثور على بيانات المستخدم"), backgroundColor: Colors.red),
                  );
                  return;
                }
                context.read<CubitForBooking>().storeBooking(
                      userToken!,
                      userId!,
                      widget.apartmentId,
                      startDate!.toIso8601String().split('T')[0],
                      endDate!.toIso8601String().split('T')[0],
                    );
              },
              child: const Text("تأكيد الحجز"),
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*class ApartmentDetails extends StatefulWidget {
  final int apartmentId;
  const ApartmentDetails( {super.key, required this.apartmentId});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  int currentIndex = 0;
  DateTime? startDate;
  DateTime? endDate;
  String? userToken;
  int? userId;
String paymentMethod = "cash";
  @override
  void initState() {
    super.initState();
    // هنا نقرأ البيانات مباشرة من SharedPreferences داخل الـ Widget
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString("token");
      userId = prefs.getInt("user_id");
      setState(() {});
    });

    // استدعاء الكيوبيت لجلب تفاصيل الشقة
    context.read<CubitApartmentSpecifications>().getApartmentById(widget.apartmentId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitForBooking, StateForBooking>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Your booking request has been sent and is awaiting the owner’s approval")),
          );
        } else if (state is BookingFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(" Booking Failed: ${state.message}")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        body: SingleChildScrollView(
          child: BlocBuilder<CubitApartmentSpecifications, StateApartmentSpecifications>(
            builder: (context, state) {
              if (state is ApartmentSpecificationsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ApartmentSpecificationsFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              } else if (state is ApartmentSpecificationsSuccess) {
                final apartment = state.apartments;
                final images = apartment.images;

                return Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) => setState(() => currentIndex = index),
                        itemBuilder: (context, index) => Image.network(images[index], fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                          ),
                          const Icon(Icons.bookmark_border, color: Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 450),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff7eaf96),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                images.length,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  width: currentIndex == index ? 12 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index ? Colors.white : Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  apartment.title,
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Color(0xFFA6C900), size: 22),
                                      const SizedBox(width: 5),
                                      Text(apartment.location, style: const TextStyle(color: Colors.white, fontSize: 18)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.layers, color: Color(0xFFA6C900), size: 22),
                                      const SizedBox(width: 5),
                                      Text(apartment.area.toString(), style: const TextStyle(color: Colors.white, fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            apartment.description,
                            style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              _infoBox(Icons.bed, apartment.rooms.toString()),
                              const SizedBox(width: 12),
                              _infoBox(Icons.bathtub, "1 Bathroom"),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${apartment.price}",
                                style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
  onPressed: () async {
    // 1️⃣ اختيار التواريخ
    final pickedStart = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedStart == null) return;

    final pickedEnd = await showDatePicker(
      context: context,
      initialDate: pickedStart.add(const Duration(days: 1)),
      firstDate: pickedStart.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedEnd == null) return;

    setState(() {
      startDate = pickedStart;
      endDate = pickedEnd;
    });

    final totalDays = endDate!.difference(startDate!).inDays;
    final totalPrice = totalDays * apartment.price;

    // 2️⃣ عرض Dialog لتأكيد الحجز
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmation of Your Booking",style: TextStyle(fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
        
            const SizedBox(height: 12),
            Center(child: Text(" ${apartment.title}", style: const TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 6),
            Center(child: Text(" Start:${startDate!.toLocal().toString().split(' ')[0]}")),
            Center(child: Text("End: ${endDate!.toLocal().toString().split(' ')[0]}")),
            Center(child: Text("Days: $totalDays")),
            Center(child: Text("Price: \$${totalPrice.toStringAsFixed(2)}")),
            

            const SizedBox(height: 6),
            const Text("Status: Pending:", style: TextStyle(color: Colors.red)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Consol"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              if (userToken == null || userId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Error: User data not found"),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

          
              context.read<CubitForBooking>().storeBooking(
                    userToken!,
                    userId!,
                    widget.apartmentId,
                    startDate!.toIso8601String().split('T')[0],
                    endDate!.toIso8601String().split('T')[0],
                  );
            },
            child: const Text("Booking "),
          ),
        ],
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
  child: const Text(
    "Book Now",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
),

                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}*/
class ApartmentDetails extends StatefulWidget {
  final int apartmentId;
  const ApartmentDetails({super.key, required this.apartmentId});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  int currentIndex = 0;
  DateTime? startDate;
  DateTime? endDate;
  String? userToken;
  int? userId;

  String paymentMethod = "cash";

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString("token");
      userId = prefs.getInt("user_id");
      setState(() {});
    });

    context.read<CubitApartmentSpecifications>().getApartmentById(
      widget.apartmentId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitForBooking, StateForBooking>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Your booking request has been sent and is awaiting approval",
              ),
            ),
          );
        } else if (state is BookingFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Booking Failed: ${state.message}")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7eaf96),
        body: SingleChildScrollView(
          child: BlocBuilder<CubitApartmentSpecifications, StateApartmentSpecifications>(
            builder: (context, state) {
              if (state is ApartmentSpecificationsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ApartmentSpecificationsFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              }

              if (state is ApartmentSpecificationsSuccess) {
                final apartment = state.apartments;
                final images = apartment.images;

                return Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (i) => setState(() => currentIndex = i),
                        itemBuilder: (context, i) =>
                            Image.network(images[i], fit: BoxFit.cover),
                      ),
                    ),

                    /// back button
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),

                    /// content
                    Container(
                      margin: const EdgeInsets.only(top: 450),
                      padding: const EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff7eaf96),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// dots
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                images.length,
                                (i) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  width: currentIndex == i ? 12 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: currentIndex == i
                                        ? Colors.white
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          Text(
                            apartment.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            apartment.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 30),

                          Row(
                            children: [
                              _infoBox(Icons.bed, apartment.rooms.toString()),
                              const SizedBox(width: 12),
                              _infoBox(Icons.bathtub, "1 Bathroom"),
                            ],
                          ),

                          const SizedBox(height: 40),

                          /// price + booking
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${apartment.price}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () async {
                                  /// date pick
                                  final pickedStart = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (pickedStart == null) return;

                                  final pickedEnd = await showDatePicker(
                                    context: context,
                                    initialDate: pickedStart.add(
                                      const Duration(days: 1),
                                    ),
                                    firstDate: pickedStart.add(
                                      const Duration(days: 1),
                                    ),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (pickedEnd == null) return;

                                  startDate = pickedStart;
                                  endDate = pickedEnd;

                                  final days = endDate!
                                      .difference(startDate!)
                                      .inDays;
                                  final totalPrice = days * apartment.price;

                                  /// dialog
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text(
                                        "Confirm Booking",
                                        textAlign: TextAlign.center,
                                      ),
                                      content: StatefulBuilder(
                                        builder: (context, setDialogState) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  " ${apartment.title}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Center(
                                                child: Text(
                                                  " Start:${startDate!.toLocal().toString().split(' ')[0]}",
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "End: ${endDate!.toLocal().toString().split(' ')[0]}",
                                                ),
                                              ),
                                              Text("Days: $days"),
                                              Text(
                                                "Price: \$${totalPrice.toStringAsFixed(2)}",
                                              ),
                                              const Divider(),

                                              const Text(
                                                "Payment Method",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              RadioListTile<String>(
                                                title: const Text("Cash"),
                                                value: "cash",
                                                groupValue: paymentMethod,
                                                onChanged: (v) {
                                                  setDialogState(() {
                                                    paymentMethod = v!;
                                                  });
                                                },
                                              ),

                                              RadioListTile<String>(
                                                title: const Text(
                                                  "Credit Card",
                                                ),
                                                value: "card",
                                                groupValue: paymentMethod,
                                                onChanged: (v) {
                                                  setDialogState(() {
                                                    paymentMethod = v!;
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          child: const Text("Confirm"),
                                          onPressed: () {
                                            Navigator.pop(context);

                                            context
                                                .read<CubitForBooking>()
                                                .storeBooking(
                                                  userToken!,
                                                  userId!,
                                                  widget.apartmentId,
                                                  startDate!
                                                      .toIso8601String()
                                                      .split('T')[0],
                                                  endDate!
                                                      .toIso8601String()
                                                      .split('T')[0],
                                                );

                                            debugPrint(
                                              "Payment: $paymentMethod",
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
