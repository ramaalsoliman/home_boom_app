import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:home_boom_app/Apartments/model/describtion_model.dart';
import 'package:home_boom_app/Booking/presentation/views/editing.dart';
import 'package:home_boom_app/Booking/presentation/views/pending.dart';
import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';
import 'package:home_boom_app/page_for_lord/presentation/manage/cubit_loard.dart';
import 'package:home_boom_app/page_for_lord/presentation/manage/state_loard.dart';
import 'package:home_boom_app/view/list_of_apartment.dart';
import 'package:home_boom_app/pageforfilter/persentation/views/page_foe_filter.dart';

/*class OwnerApartmentsPage extends StatefulWidget {
  const OwnerApartmentsPage({super.key});

  @override
  State<OwnerApartmentsPage> createState() => _OwnerApartmentsPageState();
}

class _OwnerApartmentsPageState extends State<OwnerApartmentsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _editApartment(int index) {
    // هنا ممكن تضيف صفحة تعديل الشقة وتمرير بيانات الشقة
    print("Edit apartment: ${apartmentList[index].name}");
  }

  void _deleteApartment(int index) {
    // هنا ممكن تضيف منطق حذف الشقة عبر الباك
    print("Delete apartment: ${apartmentList[index].name}");
    setState(() {
      apartmentList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: apartmentList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final apartment = apartmentList[index];
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            apartment.image,
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
                              apartment.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Colors.grey.shade500),
                                const SizedBox(width: 4),
                                Text(
                                  apartment.descebtion,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              apartment.price,
                              style: const TextStyle(
                                  color: Color(0xff7eaf96),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => _editApartment(index),
                                  icon: const Icon(Icons.edit),
                                  label: const Text("Edit"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff7eaf96)),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () => _deleteApartment(index),
                                  icon: const Icon(Icons.delete),
                                  label: const Text("Delete"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff7eaf96)),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff7eaf96),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}*/

/*class OwnerApartmentsPage extends StatefulWidget {
  const OwnerApartmentsPage({super.key});

  @override
  State<OwnerApartmentsPage> createState() => _OwnerApartmentsPageState();
}

class _OwnerApartmentsPageState extends State<OwnerApartmentsPage> {
  int _selectedIndex = 0;
  TextEditingController priceController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
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
    // استدعاء الكيوبت لجلب شقق المالك
    context.read<CubitLoard>().getOwnerApartments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitLoard, StateLoard>(
      listener: (context, state) {
        if (state is ApartmentDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Apartment deleted successfully")),
          );
        } else if (state is ApartmentUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Apartment updated successfully")),
          );
        } if (state is UpdateApartmentSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Apartment Updated Successfully")),
      );
    }

    if (state is DeleteApartmentSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Apartment Deleted Successfully")),
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
              BlocBuilder<CubitLoard, StateLoard>(
                builder: (context, state) {
                  if (state is LoardApartmentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is LoardApartmentFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }
                  if (state is LoardApartmentSuccess) {
                    final apartments = state.apartments;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: apartments.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ApartmentDetails(apartmentId: apartment.id,);
                            }));
                          },
                          child: Container(
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        apartment.title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey.shade500,
                                          ),
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
                                        "\$${apartment.price}",
                                        style: const TextStyle(
                                          color: Color(0xff7eaf96),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              priceController.text = apartment
                                                  .price
                                                  .toString();
                                              roomController.text = apartment
                                                  .rooms
                                                  .toString();
                          
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("Edit Apartment"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              priceController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                                labelText:
                                                                    "Price",
                                                              ),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              roomController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                                labelText:
                                                                    "Rooms",
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                              context,
                                                            ),
                                                        child: Text("Cancel"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          final updated =
                                                              apartment.copyWith(
                                                                price: int.parse(
                                                                  priceController
                                                                      .text,
                                                                ),
                                                                rooms: int.parse(
                                                                  roomController
                                                                      .text,
                                                                ),
                                                              );
                          
                                                          context
                                                              .read<CubitLoard>()
                                                              .updateApartment(
                                                               apartment.id,
                                                               int.parse(priceController.text),
                                                               int.parse(roomController.text)
                                                              );
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("Save"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.edit),
                                            label: const Text("Edit"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff7eaf96),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              final confirm = await showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Text(
                                                    "Delete Confirmation",
                                                  ),
                                                  content: Text(
                                                    "Are you sure you want to delete this apartment?",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                            context,
                                                            false,
                                                          ),
                                                      child: Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                            context,
                                                            true,
                                                          ),
                                                      child: Text("Delete"),
                                                    ),
                                                  ],
                                                ),
                                              );
                          
                                              if (confirm == true) {
                                                context
                                                    .read<CubitLoard>()
                                                    .deleteApartment(
                                                      apartment.id,
                                                   
                                                    );
                                              }
                                            },
                          
                                            icon: const Icon(Icons.delete),
                                            label: const Text("Delete"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff7eaf96),
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
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff7eaf96),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_outlined),
              label: 'Editing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
*/
class OwnerApartmentsPage extends StatefulWidget {
  const OwnerApartmentsPage({super.key});

  @override
  State<OwnerApartmentsPage> createState() => _OwnerApartmentsPageState();
}

class _OwnerApartmentsPageState extends State<OwnerApartmentsPage> {
  int _selectedIndex = 0;
  TextEditingController priceController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  void _onItemTapped(int index) {
  if (index == 1) { // Pending bookings
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PendingBookingsScreen()),
    );
    return; // لا تغير الـ selectedIndex
  }

  if (index == 2) { // Editing / Update Requests
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OwnerPendingUpdatesScreen()),
    );
    return; // لا تغير الـ selectedIndex
  }

  if (index == 3) { // Settings
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
    context.read<CubitLoard>().getOwnerApartments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitLoard, StateLoard>(
      listener: (context, state) {
        if (state is ApartmentDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Apartment deleted successfully")),
          );
        } else if (state is ApartmentUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Apartment updated successfully")),
          );
        } else if (state is UpdateApartmentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Apartment Updated Successfully")),
          );
        } else if (state is DeleteApartmentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Apartment Deleted Successfully")),
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
              BlocBuilder<CubitLoard, StateLoard>(
                builder: (context, state) {
                  if (state is LoardApartmentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is LoardApartmentFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  }
                  if (state is LoardApartmentSuccess) {
                    final apartments = state.apartments;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: apartments.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ApartmentDetails(apartmentId: apartment.id),
                              ),
                            );
                          },
                          child: Container(
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        apartment.title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey.shade500,
                                          ),
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
                                        "\$${apartment.price}",
                                        style: const TextStyle(
                                          color: Color(0xff7eaf96),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              priceController.text =
                                                  apartment.price.toString();
                                              roomController.text =
                                                  apartment.rooms.toString();
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title:
                                                        const Text("Edit Apartment"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              priceController,
                                                          keyboardType:
                                                              TextInputType.number,
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: "Price",
                                                          ),
                                                        ),
                                                        TextField(
                                                          controller: roomController,
                                                          keyboardType:
                                                              TextInputType.number,
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: "Rooms",
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
                                                              .read<CubitLoard>()
                                                              .updateApartment(
                                                                apartment.id,
                                                                int.parse(
                                                                    priceController
                                                                        .text),
                                                                int.parse(
                                                                    roomController
                                                                        .text),
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
                                            icon: const Icon(Icons.edit),
                                            label: const Text("Edit"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xff7eaf96),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              final confirm = await showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: const Text(
                                                    "Delete Confirmation",
                                                  ),
                                                  content: const Text(
                                                    "Are you sure you want to delete this apartment?",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              false),
                                                      child: const Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              true),
                                                      child: const Text("Delete"),
                                                    ),
                                                  ],
                                                ),
                                              );

                                              if (confirm == true) {
                                                context
                                                    .read<CubitLoard>()
                                                    .deleteApartment(apartment.id);
                                              }
                                            },
                                            icon: const Icon(Icons.delete),
                                            label: const Text("Delete"),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff7eaf96),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_outlined),
              label: 'Editing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
