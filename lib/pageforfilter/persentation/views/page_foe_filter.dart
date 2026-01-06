import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/cubit_filter.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/cubit_oprationfilter.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_filter.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_opreationfilter.dart';
import 'package:home_boom_app/pageforfilter/persentation/views/page_forresult.dart';

/*class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  String? selectedProvince;
  String? selectedLocation;
  int? selectedRooms;
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  final Map<String, List<String>> provinces = {
    'Damascus': ['Mazzeh','Abu Rummaneh','Kafr Sousa'],
    'Aleppo': ['Al-Furqan','Al-Shahbaa','New Aleppo'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      appBar: AppBar(
        backgroundColor: const Color(0xff7eaf96),
        title: const Text('Search Apartments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search description...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            // المحافظة
            DropdownButton<String>(
              value: selectedProvince,
              hint: const Text("Select Province"),
              items: provinces.keys
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  selectedProvince = v;
                  selectedLocation = null;
                });
              },
            ),
            const SizedBox(height: 16),
            // الحي
            DropdownButton<String>(
              value: selectedLocation,
              hint: const Text("Select Location"),
              items: selectedProvince == null ? [] : provinces[selectedProvince]!
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => selectedLocation = v),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: minPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Min Price",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Max Price",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButton<int>(
              value: selectedRooms,
              hint: const Text("Select Rooms"),
              items: List.generate(6, (index) => index + 1)
                  .map((e) => DropdownMenuItem(value: e, child: Text("$e")))
                  .toList(),
              onChanged: (v) => setState(() => selectedRooms = v),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // هنا نرسل البيانات للCubit أو Service
                context.read<CubitFilter>().filterApartments(
                   
                      province: selectedProvince,
                      location: selectedLocation,
                      minPrice: minPriceController.text.isNotEmpty
                          ? int.parse(minPriceController.text)
                          : null,
                      maxPrice: maxPriceController.text.isNotEmpty
                          ? int.parse(maxPriceController.text)
                          : null,
                      rooms: selectedRooms,
                    );
              },
              child: const Text("Search"),
            )
          ],
        ),
      ),
    );
  }
}*/





/*class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedGovernorate;
  String? selectedArea;
  int selectedRooms = 0;

  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  final Map<String, List<String>> governorates = {
    'Damascus': ['Mazzeh', 'Abu Rummaneh', 'Mashrou Dummar', 'Al-Malki', 'Kafr Sousa'],
    'Aleppo': ['Al-Furqan', 'Al-Shahbaa', 'Al-Mukambo', 'New Aleppo', 'Al-Zahraa'],
    'Latakia': ['First Project', 'Agriculture District', 'South Corniche', 'Awqaf', 'Saliba Project'],
    'Homs': ['Construction District', 'Al-Waer', 'Damascus Road', 'Al-Hamraa', 'Al-Ghouta'],
    'Tartous': ['Al-Ghamqa', 'Sixth Project', 'Construction District', 'Corniche Street', 'Al-Raml'],
  };

  late CubitFilter cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CubitFilter>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      appBar: AppBar(
        backgroundColor: const Color(0xff7eaf96),
        title: const Text(
          'Filter',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedGovernorate = null;
                selectedArea = null;
                selectedRooms = 0;
                minPriceController.clear();
                maxPriceController.clear();
              });
            },
            child: const Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Governorate', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            dropdown(
              value: selectedGovernorate,
              hint: 'Choose the Governorate',
              items: governorates.keys.toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedArea = null;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Neighborhood', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            dropdown(
              value: selectedArea,
              hint: 'Choose the Neighborhood',
              items: selectedGovernorate == null ? [] : governorates[selectedGovernorate]!,
              onChanged: (value) {
                setState(() {
                  selectedArea = value;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text('Price', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: priceField('Minimum', minPriceController)),
                const SizedBox(width: 12),
                Expanded(child: priceField('Maximum', maxPriceController)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Num of Bedroom', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: List.generate(6, (index) {
                final room = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRooms = room;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedRooms == room ? const Color.fromARGB(255, 126, 175, 150) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(
                      room.toString(),
                      style: TextStyle(
                        color: selectedRooms == room ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 98, 85),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
  final cubit = context.read<CubitFilter>();
  await cubit.getFilteredApartments(
    province: selectedGovernorate,
    location: selectedArea,
    minPrice: int.tryParse(minPriceController.text),
    maxPrice: int.tryParse(maxPriceController.text),
    rooms: selectedRooms == 0 ? null : selectedRooms,
  );

  final state = cubit.state;
  if (state is ApartmentFilterSuccess) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FilteredResultsPage(apartments: state.apartments),
      ),
    );
  } else if (state is ApartmentFilterEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No apartments found")),
    );
  } else if (state is ApartmentFilterFauiler) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.message)),
    );
  }
},
              child: const Text('Show Property', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CubitFilter, StateFilter>(
              builder: (context, state) {
                if (state is ApartmentFilterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ApartmentFilterFauiler) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                if (state is ApartmentFilterEmpty) {
                  return const Text(
                    "No apartments found",
                    style: TextStyle(color: Colors.white),
                  );
                }

                if (state is ApartmentFilterSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.apartments.length,
                    itemBuilder: (context, index) {
                      final apartment = state.apartments[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                apartment.outdoor_image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(apartment.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text("${apartment.price}\$ - ${apartment.location}", style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
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

  Widget dropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: const Color.fromARGB(255, 74, 98, 85),
          value: value,
          hint: Text(hint, style: const TextStyle(color: Colors.white54)),
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white))))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget priceField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: const Color.fromARGB(255, 74, 98, 85)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}*/


// class FilterPage extends StatefulWidget {
//   const FilterPage({super.key});

//   @override
//   State<FilterPage> createState() => _FilterPageState();
// }

// class _FilterPageState extends State<FilterPage> {
//   String? selectedGovernorate;
//   String? selectedArea;
//   int? selectedRooms;

//   final minPriceController = TextEditingController();
//   final maxPriceController = TextEditingController();

//   late CubitFilter cubit;

//   Map<String, List<String>> locationsByProvince = {};
//   List<String> governorates = [];
//   List<int> rooms = [];
//   int? minPrice;
//   int? maxPrice;

//   @override
//   void initState() {
//     super.initState();
//     cubit = context.read<CubitFilter>();
//     fetchFiltersFromServer();
//   }

//   Future<void> fetchFiltersFromServer() async {
//     await cubit.fetchFilters();
//     final state = cubit.state;
//     if (state is FilterSuccess) {
//       setState(() {
//         governorates = state.provinces;
//         locationsByProvince = state.locationsByProvince;
//         rooms = state.rooms;
//         minPrice = state.priceRange['min'];
//         maxPrice = state.priceRange['max'];
//         minPriceController.text = minPrice?.toString() ?? '';
//         maxPriceController.text = maxPrice?.toString() ?? '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff7eaf96),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff7eaf96),
//         title: const Text(
//           'Filter',
//           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedGovernorate = null;
//                 selectedArea = null;
//                 selectedRooms = null;
//                 minPriceController.text = minPrice?.toString() ?? '';
//                 maxPriceController.text = maxPrice?.toString() ?? '';
//               });
//             },
//             child: const Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             const Text('Governorate', style: TextStyle(color: Colors.white, fontSize: 20)),
//             const SizedBox(height: 8),
//             dropdown(
//               value: selectedGovernorate,
//               hint: 'Choose the Governorate',
//               items: governorates,
//               onChanged: (value) {
//                 setState(() {
//                   selectedGovernorate = value;
//                   selectedArea = null;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text('Neighborhood', style: TextStyle(color: Colors.white, fontSize: 20)),
//             const SizedBox(height: 8),
//             dropdown(
//               value: selectedArea,
//               hint: 'Choose the Neighborhood',
//               items: selectedGovernorate == null ? [] : locationsByProvince[selectedGovernorate!] ?? [],
//               onChanged: (value) {
//                 setState(() {
//                   selectedArea = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 24),
//             const Text('Price', style: TextStyle(color: Colors.white, fontSize: 20)),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(child: priceField('Minimum', minPriceController)),
//                 const SizedBox(width: 12),
//                 Expanded(child: priceField('Maximum', maxPriceController)),
//               ],
//             ),
//             const SizedBox(height: 24),
//             const Text('Num of Bedroom', style: TextStyle(color: Colors.white, fontSize: 20)),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 8,
//               children: List.generate(rooms.length, (index) {
//                 final room = rooms[index];
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedRooms = room;
//                     });
//                   },
//                   child: Container(
//                     width: 45,
//                     height: 45,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: selectedRooms == room ? const Color.fromARGB(255, 126, 175, 150) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.white),
//                     ),
//                     child: Text(
//                       room.toString(),
//                       style: TextStyle(
//                         color: selectedRooms == room ? Colors.black : Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 74, 98, 85),
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//               ),
//               onPressed: () async {
//                 final cubit = context.read<CubitFilter>();
//                 await cubit.getFilteredApartments(
//                   province: selectedGovernorate,
//                   location: selectedArea,
//                   minPrice: int.tryParse(minPriceController.text),
//                   maxPrice: int.tryParse(maxPriceController.text),
//                   rooms: selectedRooms,
//                 );

//                 final state = cubit.state;
//                 if (state is FilterSuccess) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => FilteredResultsPage(apartments: state.apartment),
//                     ),
//                   );
//                 } else if (state is ApartmentFilterEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("No apartments found")),
//                   );
//                 } else if (state is FilterFailure) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text(state.message)),
//                   );
//                 }
//               },
//               child: const Text('Show Property', style: TextStyle(color: Colors.white, fontSize: 18)),
//             ),
//             const SizedBox(height: 20),
//             BlocBuilder<CubitFilter, StateFilter>(
//               builder: (context, state) {
//                 if (state is ApartmentFilterLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (state is ApartmentFilterFauiler) {
//                   return Text(
//                     state.message,
//                     style: const TextStyle(color: Colors.red),
//                   );
//                 }

//                 if (state is ApartmentFilterEmpty) {
//                   return const Text(
//                     "No apartments found",
//                     style: TextStyle(color: Colors.white),
//                   );
//                 }

//                 if (state is ApartmentFilterSuccess) {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: state.apartment.length,
//                     itemBuilder: (context, index) {
//                       final apartment = state.apartment[index];
//                       return Container(
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                 apartment.outdoor_image,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(apartment.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                                   const SizedBox(height: 4),
//                                   Text("${apartment.price}\$ - ${apartment.location}", style: const TextStyle(color: Colors.grey)),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }

//                 return const SizedBox();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget dropdown({
//     required String? value,
//     required String hint,
//     required List<String> items,
//     required Function(String?) onChanged,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           dropdownColor: const Color.fromARGB(255, 74, 98, 85),
//           value: value,
//           hint: Text(hint, style: const TextStyle(color: Colors.white54)),
//           isExpanded: true,
//           items: items
//               .map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white))))
//               .toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }

//   Widget priceField(String hint, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white54),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: const Color.fromARGB(255, 74, 98, 85)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }


class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedGovernorate;
  String? selectedArea;
  int selectedRooms = 0;

  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  List<String> provinces = [];
  List<String> areas = [];
  List<int> rooms = [];
  int min_price = 0;
  int max_price = 0;

  late CubitOprationfilter cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CubitOprationfilter>();
    loadFilterOptions();
  }

  void loadFilterOptions() async {
    await cubit.loadFilterOptions();
    final state = cubit.state;
    if (state is ApartmentFilterSuccess) {
      setState(() {
        provinces = state.provinces;
        rooms = state.rooms;
        min_price = state.min_price;
        max_price = state.max_price;
      });
    } else if (state is FilterOptionFauiler) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  void loadAreas(String province) async {
    await cubit.loadLocationsByProvince(province);
    final state = cubit.state;
    if (state is FilterLocationsLoaded) {
      setState(() {
        areas = state.locations;
      });
    } else if (state is FilterOptionFauiler) {
      setState(() {
        areas = [];
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      appBar: AppBar(
        backgroundColor: const Color(0xff7eaf96),
        title: const Text(
          'Filter',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedGovernorate = null;
                selectedArea = null;
                selectedRooms = 0;
                minPriceController.clear();
                maxPriceController.clear();
              });
            },
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Governorate',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            dropdown(
              value: selectedGovernorate,
              hint: 'Choose the Governorate',
              items: provinces,
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedArea = null;
                  areas = [];
                });
                if (value != null) loadAreas(value);
              },
            ),
            const SizedBox(height: 16),
            const Text('Neighborhood',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            dropdown(
              value: areas.contains(selectedArea) ? selectedArea : null,
              hint: 'Choose the Neighborhood',
              items: areas,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedArea = value;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            const Text('Price', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: priceField('Minimum', minPriceController)),
                const SizedBox(width: 12),
                Expanded(child: priceField('Maximum', maxPriceController)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Num of Bedroom',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: List.generate(6, (index) {
                final room = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRooms = room;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedRooms == room
                          ? const Color.fromARGB(255, 126, 175, 150)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(
                      room.toString(),
                      style: TextStyle(
                        color: selectedRooms == room ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
         ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 74, 98, 85),
    padding: const EdgeInsets.symmetric(vertical: 16),
  ),
 onPressed: () async {
  final province = selectedGovernorate;
  final location = selectedArea;
  final rooms = selectedRooms > 0 ? selectedRooms : null;
  final minPrice = minPriceController.text.isNotEmpty
      ? int.tryParse(minPriceController.text)
      : null;
  final maxPrice = maxPriceController.text.isNotEmpty
      ? int.tryParse(maxPriceController.text)
      : null;

  await context.read<CubitFilter>().getFilteredApartments(
    province: province,
    location: location,
    rooms: rooms,
    min_price: minPrice,
    max_price: maxPrice,
  );

  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const FilterResultPage()),
  );
},

  child: const Text(
    'Show Property',
    style: TextStyle(color: Colors.white, fontSize: 18),
  ),
)



          ],
        ),
      ),
    );
  }

  Widget dropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: const Color.fromARGB(255, 74, 98, 85),
          value: items.contains(value) ? value : null,
          hint: Text(hint, style: const TextStyle(color: Colors.white54)),
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e, style: const TextStyle(color: Colors.white)),
                  ))
              .toList(),
          onChanged: (newValue) {
            if (newValue != null) onChanged(newValue);
          },
        ),
      ),
    );
  }

  Widget priceField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 74, 98, 85)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
