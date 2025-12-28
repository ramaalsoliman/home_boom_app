import 'package:flutter/material.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';

class FilteredResultsPage extends StatelessWidget {
  final List<FilterModel> apartments;

  const FilteredResultsPage({super.key, required this.apartments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      appBar: AppBar(
        backgroundColor: const Color(0xff7eaf96),
        title: const Text(
          'Filtered Results',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: apartments.isEmpty
          ? const Center(
              child: Text(
                "No apartments found",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: apartments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final apartment = apartments[index];
                return Container(
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade900,
                        blurStyle: BlurStyle.solid,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      SizedBox(height: 9),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              apartment.title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.grey.shade500),
                                const SizedBox(width: 4),
                                Text(
                                  apartment.location,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${apartment.price}\$",
                              style: const TextStyle(
                                  color: Color(0xff7eaf96),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}