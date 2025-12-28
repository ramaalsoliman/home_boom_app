import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_boom_app/Apartments/model/describtion_model.dart';
import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';
import 'package:home_boom_app/view/list_of_apartment.dart';
import 'package:home_boom_app/pageforfilter/persentation/views/page_foe_filter.dart';

class OwnerApartmentsPage extends StatefulWidget {
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
}