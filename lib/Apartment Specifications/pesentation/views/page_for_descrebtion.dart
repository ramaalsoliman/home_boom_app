import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/cubit_apartment%20_specifications.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/state_apartment%20_specifications.dart';





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
                                      fontSize: 28,
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
                                infoBox(Icons.bathtub, "3 Bathroom"),
                              ],
                            ),

                            const SizedBox(height: 40),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  apartment.price.toString(),
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
}
