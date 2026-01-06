import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:home_boom_app/pageforfilter/model/filter_model.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/cubit_filter.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/state_filter.dart';

class FilterResultPage extends StatelessWidget {
  const FilterResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filtered Apartments")),
      body: BlocBuilder<CubitFilter, StateFilter>(
        builder: (context, state) {
          if (state is ApartmentFilterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApartmentFilterrSuccess) {
            final apartments = state.apartment;
            if (apartments.isEmpty) {
              return const Center(child: Text("No apartments found"));
            }
            return ListView.separated(
              itemCount: apartments.length,
              shrinkWrap: true,
             
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (_, index) {
                final apt = apartments[index];
                return InkWell(
                  onTap: () {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ApartmentDetails(apartmentId: apt.id,);

                    }));
                    
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
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                          apt.outdoor_image,
                                        ),
                                        height: 220,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 9),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Text(
                                        apt.title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey.shade500,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            apt.location,
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Text(
                                        " \$${apt.price} ",
                                        style: TextStyle(
                                          color: Color(0xff7eaf96),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ApartmentFilterFauiler) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
