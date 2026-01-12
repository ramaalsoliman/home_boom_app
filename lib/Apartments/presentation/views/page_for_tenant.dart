import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartments/model/Apartment_model.dart';
import 'package:home_boom_app/Apartments/model/describtion_model.dart';
import 'package:home_boom_app/Apartments/presentation/manage/cubit_apartment.dart';
import 'package:home_boom_app/Apartments/presentation/manage/state_apartment.dart';
import 'package:home_boom_app/MyBooking/presentation/views/MyBookingPage.dart';
import 'package:home_boom_app/auth/presentation/views/sign_up_screen.dart';
import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';
import 'package:home_boom_app/favorite/presentation/manage/FavoriteCubit.dart';
import 'package:home_boom_app/favorite/presentation/manage/favorite_state.dart';
import 'package:home_boom_app/favorite/presentation/views/favorite_screen.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/cubit_filter.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_filter.dart';
import 'package:home_boom_app/view/list_for_describtion.dart';
import 'package:home_boom_app/view/list_of_apartment.dart';
import 'package:home_boom_app/pageforfilter/persentation/views/page_foe_filter.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/*class PageForTenant extends StatefulWidget {
  const PageForTenant({super.key});

  @override
  State<PageForTenant> createState() => _PageForTenantState();
}

class _PageForTenantState extends State<PageForTenant> {
 void _onItemTapped(int index) {
  if (index == 3) {
    // صفحة الإعدادات
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
    return;
  }

  setState(() {
    _selectedIndex = index;
  });
}
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              spacing: 180,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    ("Find Your \nDream House"),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Color(0xff7eaf96),
                        size: 35,
                      ),
                      title: Text(
                        ("Search"),
                        style: TextStyle(
                          color: Color(0xff7eaf96),
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return FilterPage();
                        }));
                      },
                      child: Icon(
                        Icons.tune_outlined,
                        size: 28,
                        color: Color(0xff7eaf96),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 145),
              child: Text("Recomended for you",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
            ),
            
            

           ListView.separated(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: apartmentList.length,
 
  separatorBuilder: (context, listindex) => SizedBox(height: 20),
  itemBuilder: (context, index) {
  
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ApartmentDetails(model: desmodel[index],);

        }));
      },
   child:   Container(
    height: 370,

  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [ BoxShadow(
                  color: Colors.grey.shade900,

                  blurStyle: BlurStyle.solid,
                  blurRadius: 20,

                  
                
                ),]
    
  ),
       child:  Column(
          children: [
            SizedBox(height: 15,),
           
           Padding(
             padding: const EdgeInsets.only(left: 15,right: 15),
             child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage(apartmentList[index].image),height: 220,width: double.infinity,fit: BoxFit.cover,))),
           ),
           SizedBox(height: 9,),
            
      

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                     apartmentList[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 15),
                    child: Row(
                      children:[
                        Icon(Icons.location_on_outlined, color:Colors.grey.shade500,),
                        SizedBox(width: 4,),
                       Text( apartmentList[index].descebtion,
                      style: TextStyle(
                        color:Colors.grey.shade500,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      ] 

                     
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                     apartmentList[index].price,
                      style: TextStyle(
                        color:Color(0xff7eaf96),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  /*SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        apartmentList[index].price,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),*/
                ],
              ),



            
          ],
        ), 
         
     )
    );
  },
)
          ],
         /* */
          
        ),
      
      ),

      bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xff7eaf96),
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,

    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_border),
        label: 'Bookings',
      ),
      
      BottomNavigationBarItem(
        
        icon: InkWell(
          child: Icon(Icons.settings)),
        label: 'Settings',
      ),
    ],
  ),

    );
  }
}*/

// class PageForTenant extends StatefulWidget {
//   const PageForTenant({super.key});
//   @override
//   State<PageForTenant> createState() => _PageForTenantState();
// }

// class _PageForTenantState extends State<PageForTenant> {
//   int _selectedIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     context.read<CubitApartment>().getallApartment();
//   }

// void _onItemTapped(int index) async {
//   if (index == 2) {
//     final prefs = await SharedPreferences.getInstance();
//     final userId = prefs.getInt("user_id");
//     final token = prefs.getString("token");

//     if (userId != null && token != null && token.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => MyBookingsPage(
//             userId: userId,
//             token: token,
//           ),
//         ),
//       );
//     } else {
//       print("❌ userId أو token غير موجودين!");
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("You must log in again."),
//       ));
//     }
//     return;
//   }

//   // Settings
//   if (index == 3) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => SettingsScreen()),
//     );
//     return;
//   }

//   setState(() => _selectedIndex = index);
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff7eaf96),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50, left: 20),
//                   child: Text(
//                     "Find Your \nDream House",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, right: 20),
//                   child: Icon(
//                     Icons.notifications_none,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 20),
//                   child: Container(
//                     width: 300,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.white,
//                     ),
//                     child: const ListTile(
//                       leading: Icon(
//                         Icons.search,
//                         color: Color(0xff7eaf96),
//                         size: 30,
//                       ),
//                       title: Text(
//                         "Search",
//                         style: TextStyle(
//                           color: Color(0xff7eaf96),
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 25,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return FilterPage();
//                             },
//                           ),
//                         );
//                       },
//                       child: Icon(
//                         Icons.tune_outlined,
//                         color: Color(0xff7eaf96),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20, right: 145),
//               child: Text(
//                 "Recomended for you",
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             BlocBuilder<CubitApartment, StateApartment>(
//               builder: (context, state) {
//                 if (state is ApartmentLoading) {
//                   return Center(child: const CircularProgressIndicator());
//                 }
//                 if (state is ApartmentFailure) {
//                   return Text(
//                     state.message,
//                     style: const TextStyle(color: Colors.red),
//                   );
//                 }
//                 if (state is ApartmentSuccess) {
//                   return ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: state.apartments.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 20),
//                     itemBuilder: (context, index) {
//                       final apartment = state.apartments[index];
//                       return InkWell(
//                         onTap: () {
//                           print("Apartment ID selected: ${apartment.id}");
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return ApartmentDetails(
//                                   apartmentId: apartment.id,
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           height: 370,
//                           margin: const EdgeInsets.symmetric(horizontal: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.shade900,
//                                 blurStyle: BlurStyle.solid,
//                                 blurRadius: 20,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               SizedBox(height: 15),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 15,
//                                   right: 15,
//                                 ),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image(
//                                       image: NetworkImage(
//                                         apartment.outdoor_image,
//                                       ),
//                                       height: 220,
//                                       width: double.infinity,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 9),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 15,
//                                       right: 15,
//                                     ),
//                                     child: Text(
//                                       apartment.title,
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 10,
//                                       right: 15,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.location_on_outlined,
//                                           color: Colors.grey.shade500,
//                                         ),
//                                         SizedBox(width: 4),
//                                         Text(
//                                           apartment.location,
//                                           style: TextStyle(
//                                             color: Colors.grey.shade500,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 15,
//                                       right: 15,
//                                     ),
//                                     child: Text(
//                                       " \$${apartment.price} ",
//                                       style: TextStyle(
//                                         color: Color(0xff7eaf96),
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
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
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xff7eaf96),
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark_border),
//             label: 'Bookings',
//           ),
//           BottomNavigationBarItem(
//             icon: InkWell(child: Icon(Icons.settings)),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

/*class PageForTenant extends StatefulWidget {
  const PageForTenant({super.key});
  @override
  State<PageForTenant> createState() => _PageForTenantState();
}

class _PageForTenantState extends State<PageForTenant> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CubitApartment>().getallApartment();
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SettingsScreen()),
      );
      return;
    }
    setState(() => _selectedIndex = index);
  }

  void _performSearch(String value) {
    if (value.isNotEmpty) {
      context.read<CubitFilter>().getFilteredApartments(location: value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Find Your \nDream House",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),

            // Search + Filter Row
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _searchController,
                        onSubmitted: _performSearch,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xff7eaf96)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterPage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.tune_outlined,
                        color: Color(0xff7eaf96),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // نتائج البحث أو الشقق الموصى بها
            BlocBuilder<CubitFilter, StateFilter>(
              builder: (context, state) {
                if (state is ApartmentFilterLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ApartmentFilterEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "No apartments found.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                } else if (state is ApartmentFilterSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.apartment.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final apartment = state.apartment[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ApartmentDetails(apartmentId: apartment.id),
                            ),
                          );
                        },
                        child: Container(
                          height: 370,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      apartment.title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,
                                            color: Colors.grey.shade500),
                                        SizedBox(width: 4),
                                        Text(
                                          "${apartment.location} - ${apartment.province}",
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${apartment.price}\$",
                                      style: TextStyle(
                                          color: Color(0xff7eaf96),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ApartmentFilterFauiler) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  // Default: عرض كل الشقق من CubitApartment إذا لم يتم البحث بعد
                  return BlocBuilder<CubitApartment, StateApartment>(
                    builder: (context, state) {
                      if (state is ApartmentLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ApartmentFailure) {
                        return Center(
                            child: Text(state.message,
                                style: TextStyle(color: Colors.red)));
                      } else if (state is ApartmentSuccess) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.apartments.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final apartment = state.apartments[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ApartmentDetails(
                                        apartmentId: apartment.id),
                                  ),
                                );
                              },
                              child: Container(
                                height: 370,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
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
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            apartment.title,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                  color: Colors.grey.shade500),
                                              SizedBox(width: 4),
                                              Text(
                                                apartment.location,
                                                style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "${apartment.price}\$",
                                            style: TextStyle(
                                                color: Color(0xff7eaf96),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox();
                    },
                  );
                }
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
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}*/

/*class PageForTenant extends StatefulWidget {
  const PageForTenant({super.key});

  @override
  State<PageForTenant> createState() => _PageForTenantState();
}

class _PageForTenantState extends State<PageForTenant> {
  int _selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // تحميل كل الشقق عند فتح الصفحة
    context.read<CubitApartment>().getallApartment();
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SettingsScreen()),
      );
      return;
    }
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // عنوان الصفحة والـ notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Find Your \nDream House",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, right: 20),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),

            // البحث والفلترة
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          context.read<CubitFilter>().searchApartments(value);
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xff7eaf96)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                        // result يحتوي القيم اللي اختارها المستخدم
                        if (result != null) {
                          context.read<CubitFilter>().filterApartments(
                                province: result['province'],
                                location: result['location'],
                                minPrice: result['minPrice'],
                                maxPrice: result['maxPrice'],
                                rooms: result['rooms'],
                              );
                        }
                      },
                      child: const Icon(
                        Icons.tune_outlined,
                        color: Color(0xff7eaf96),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // نص "Recomended for you"
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 145),
              child: const Text(
                "Recomended for you",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // عرض النتائج (إما البحث أو جميع الشقق)
            BlocBuilder<CubitFilter, StateFilter>(
              builder: (context, filterState) {
                if (filterState is ApartmentFilterLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else if (filterState is ApartmentFilterSuccess) {
                  return _buildApartmentList(filterState.apartment);
                } else if (filterState is ApartmentFilterEmpty) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "No apartments found.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ));
                } else if (filterState is ApartmentFilterFauiler) {
                  return Center(
                      child: Text(
                    filterState.message,
                    style: const TextStyle(color: Colors.red),
                  ));
                }

                // إذا لا يوجد بحث، عرض جميع الشقق
                return BlocBuilder<CubitApartment, StateApartment>(
                  builder: (context, state) {
                    if (state is ApartmentLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.white));
                    } else if (state is ApartmentFailure) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is ApartmentSuccess) {
                      return _buildApartmentList(state.apartments);
                    }
                    return const SizedBox();
                  },
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
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildApartmentList(List apartments) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: apartments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final apartment = apartments[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApartmentDetails(
                  apartmentId: apartment.id,
                ),
              ),
            );
          },
          child: Container(
            height: 370,
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        apartment.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        " ${apartment.price}\$ ",
                        style: const TextStyle(
                          color: Color(0xff7eaf96),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
}

*/

/*class PageForTenant extends StatefulWidget {
  const PageForTenant({super.key});

  @override
  State<PageForTenant> createState() => _PageForTenantState();
}

class _PageForTenantState extends State<PageForTenant> {
  int _selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CubitApartment>().getallApartment();
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SettingsScreen()),
      );
      return;
    }
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // عنوان الصفحة والـ notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Find Your \nDream House",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, right: 20),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),

            // البحث والفلترة
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          // البحث باستخدام CubitFilter
                          context.read<CubitFilter>().fetchFilters();
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xff7eaf96)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: InkWell(
                      onTap: () async {
                        // فتح صفحة الفلترة
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FilterPage(),
                          ),
                        );
                        if (result != null) {
                          // إرسال الفلاتر المختارة للكيوبيت
                          context.read<CubitFilter>().getFilteredApartments(
                                province: result['province'],
                                location: result['location'],
                                minPrice: result['minPrice'],
                                maxPrice: result['maxPrice'],
                                rooms: result['rooms'],
                              );
                        }
                      },
                      child: const Icon(
                        Icons.tune_outlined,
                        color: Color(0xff7eaf96),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // نص "Recomended for you"
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 145),
              child: const Text(
                "Recomended for you",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // عرض النتائج: إما البحث أو جميع الشقق
            BlocBuilder<CubitFilter, StateFilter>(
              builder: (context, filterState) {
                if (filterState is ApartmentFilterLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else if (filterState is ApartmentFilterSuccess) {
                  return _buildApartmentList(filterState.apartment);
                } else if (filterState is ApartmentFilterEmpty) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "No apartments found.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ));
                } else if (filterState is ApartmentFilterFauiler) {
                  return Center(
                      child: Text(
                    filterState.message,
                    style: const TextStyle(color: Colors.red),
                  ));
                }

                // إذا لا يوجد بحث/فلترة، عرض جميع الشقق
                return BlocBuilder<CubitApartment, StateApartment>(
                  builder: (context, state) {
                    if (state is ApartmentLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.white));
                    } else if (state is ApartmentFailure) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is ApartmentSuccess) {
                      return _buildApartmentList(state.apartments);
                    }
                    return const SizedBox();
                  },
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
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildApartmentList(List apartments) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: apartments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final apartment = apartments[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApartmentDetails(
                  apartmentId: apartment.id,
                ),
              ),
            );
          },
          child: Container(
            height: 370,
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        apartment.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        " ${apartment.price}\$ ",
                        style: const TextStyle(
                          color: Color(0xff7eaf96),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
}
*/

// class PageForTenant extends StatefulWidget {
//   const PageForTenant({super.key});
//   @override
//   State<PageForTenant> createState() => _PageForTenantState();
// }

// class _PageForTenantState extends State<PageForTenant> {
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     context.read<CubitApartment>().getallApartment();
//   }

//   void _onItemTapped(int index) async {
//     if (index == 2) {
//       final prefs = await SharedPreferences.getInstance();
//       final userId = prefs.getInt("user_id");
//       final token = prefs.getString("token");

//       if (userId != null && token != null && token.isNotEmpty) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => MyBookingsPage(
//               userId: userId,
//               token: token,
//             ),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("You must log in again.")),
//         );
//       }
//       return;
//     }

//     if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => SettingsScreen()),
//       );
//       return;
//     }

//     setState(() => _selectedIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff7eaf96),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50, left: 20),
//                   child: Text(
//                     "Find Your \nDream House",
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, right: 20),
//                   child: const Icon(
//                     Icons.notifications_none,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),

//             // Search + Filter
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 20),
//                   child: Container(
//                     width: 300,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.white,
//                     ),
//                     child: const ListTile(
//                       leading: Icon(
//                         Icons.search,
//                         color: Color(0xff7eaf96),
//                         size: 30,
//                       ),
//                       title: Text(
//                         "Search",
//                         style: TextStyle(
//                           color: Color(0xff7eaf96),
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 25,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => FilterPage(),
//                           ),
//                         );
//                       },
//                       child: const Icon(
//                         Icons.tune_outlined,
//                         color: Color(0xff7eaf96),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20, right: 145),
//               child: const Text(
//                 "Recommended for you",
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),

//             // Apartments List
//             BlocBuilder<CubitApartment, StateApartment>(
//               builder: (context, state) {
//                 if (state is ApartmentLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (state is ApartmentFailure) {
//                   return Text(
//                     state.message,
//                     style: const TextStyle(color: Colors.red),
//                   );
//                 }

//                 if (state is ApartmentSuccess) {
//                   return ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: state.apartments.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 20),
//                     itemBuilder: (context, index) {
//                       final apartment = state.apartments[index];

//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => ApartmentDetails(
//                                 apartmentId: apartment.id,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           height: 400,
//                           margin: const EdgeInsets.symmetric(horizontal: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.shade900,
//                                 blurStyle: BlurStyle.solid,
//                                 blurRadius: 20,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               const SizedBox(height: 15),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 15,
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image.network(
//                                     apartment.outdoor_image,
//                                     height: 220,
//                                     width: double.infinity,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 9),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       apartment.title,
//                                       style: const TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Row(
//                                       children: [
//                                         Icon(
//                                           Icons.location_on_outlined,
//                                           color: Colors.grey.shade500,
//                                         ),
//                                         const SizedBox(width: 4),
//                                         Text(
//                                           apartment.location,
//                                           style: TextStyle(
//                                             color: Colors.grey.shade500,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       "\$${apartment.price}",
//                                       style: const TextStyle(
//                                         color: Color(0xff7eaf96),
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 5),

//                                     RatingBarIndicator(
//                                       rating: apartment.rating != null
//                                           ? apartment.rating! / 20
//                                           : 0,
//                                       itemBuilder: (context, _) =>
//                                           const Icon(Icons.star,
//                                               color: Colors.amber),
//                                       itemCount: 5,
//                                       itemSize: 20,
//                                       direction: Axis.horizontal,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
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
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xff7eaf96),
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark_border),
//             label: 'Bookings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

class PageForTenant extends StatefulWidget {
  const PageForTenant({super.key});

  @override
  State<PageForTenant> createState() => _PageForTenantState();
}

class _PageForTenantState extends State<PageForTenant> {
  int _selectedIndex = 0;
  late int userId;
  late String token;

  @override
  void initState() {
    super.initState();
    _loadAuth().then((_) {
      context.read<CubitApartment>().getallApartment();
      context.read<FavoriteCubit>().getFavorites(userId, token);
    });
  }

  Future<void> _loadAuth() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("user_id") ?? 0;
    token = prefs.getString("token") ?? "";
  }

  void _onItemTapped(int index) async {
    if (index == 1) {
      if (userId != 0 && token.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FavoritesPage(userId: userId, token: token),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Please log in.")));
      }
      return;
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MyBookingsPage(userId: userId, token: token),
        ),
      );
      return;
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SettingsScreen()),
      );
      return;
    }

    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7eaf96),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Find Your \nDream House",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Colors.white, size: 40),
                ],
              ),
            ),

            // Search + Filter
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.search, color: Color(0xff7eaf96)),
                        title: Text("Search"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.tune_outlined,
                        color: Color(0xff7eaf96),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => FilterPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended for you",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // BlocBuilder للشقق + المفضلة
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, favState) {
                final favoriteIds = <int>{};
                if (favState is FavoriteSuccess) {
                  favoriteIds.addAll(
                    favState.favorites.map((e) => e.apartmentId),
                  );
                }

                return BlocBuilder<CubitApartment, StateApartment>(
                  builder: (context, state) {
                    if (state is ApartmentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ApartmentFailure) {
                      return Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    if (state is ApartmentSuccess) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.apartments.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final apartment = state.apartments[index];
                          final isFavorite = favoriteIds.contains(apartment.id);

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ApartmentDetails(
                                    apartmentId: apartment.id,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 450,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                               color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade700,
                                    blurRadius: 10,
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
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          apartment.title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(apartment.location),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${apartment.price}",
                                              style: const TextStyle(
                                                color: Color(0xff7eaf96),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: isFavorite
                                                    ? const Color(0xff7eaf96)
                                                    : Colors.grey,
                                              ),
                                              onPressed: () {
                                                context
                                                    .read<FavoriteCubit>()
                                                    .addToFavorite(
                                                      userId,
                                                      apartment.id,
                                                      token,
                                                    );
                                              },
                                            ),
                                          ],
                                        ),
                                        RatingBarIndicator(
                                          rating: apartment.rating != null
                                              ? apartment.rating! / 20
                                              : 0,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                          unratedColor:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade300,
                                          itemCount: 5,
                                          itemSize: 20,
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
