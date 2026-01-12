// import 'package:flutter/material.dart';


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BookingPage extends StatefulWidget {
//   final String title;
//   final int apartmentId;
//   final int pricePerDay;
//   final DateTime startDate;
//   final DateTime endDate;

//   const BookingPage({
//     super.key,
//     required this.title,
//     required this.apartmentId,
//     required this.pricePerDay,
//     required this.startDate,
//     required this.endDate,
//   });

//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   late int totalDays;
//   late int totalPrice;

//   @override
//   void initState() {
//     super.initState();
//     totalDays = widget.endDate.difference(widget.startDate).inDays;
//     if (totalDays < 1) totalDays = 1;

//     totalPrice = widget.pricePerDay * totalDays;
//   }

//   String formatDate(DateTime date) {
//     return DateFormat('yyyy-MM-dd').format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff7eaf96),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text("Book Apartment", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           color: Color(0xff7eaf96),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 15),

//             Text(
//               widget.title,
//               style: const TextStyle(
//                 fontSize: 26,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 30),

//             infoTile("📅 Start Date", formatDate(widget.startDate)),
//             infoTile("📅 End Date", formatDate(widget.endDate)),
//             infoTile("💲 Price per day", "\$${widget.pricePerDay}"),
//             infoTile("📆 Total Days", "$totalDays"),
//             infoTile("💰 Total Price", "\$$totalPrice"),

//             const Spacer(),

//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // هون لاحقاً تحطي عملية الحجز API
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("Booking request sent (UI only for now)"),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text(
//                   "Confirm Booking",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget infoTile(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white70, fontSize: 16),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             value,
//             style: const TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }
