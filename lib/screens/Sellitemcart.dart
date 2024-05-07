// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:talapets/screens/categoriesScreen.dart';
// import 'package:talapets/screens/emergencyScreen.dart';
// import 'package:talapets/screens/homeScreen.dart';
// import 'package:talapets/screens/profile.dart';
//
// class SellItemCart extends StatefulWidget {
//   @override
//   _SellItemCartState createState() => _SellItemCartState();
// }
//
// class _SellItemCartState extends State<SellItemCart> {
//   int _navIcon = 0;
//   List<QueryDocumentSnapshot> data = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   getData() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("sellpet").get();
//     data.addAll(querySnapshot.docs);
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<int> _ages = List.generate(61, (index) => index);
//
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/back75.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.transparent,
//         appBar: appBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 20), // Add some space
//               Center(
//                 child: Text(
//                   'Your Selling Pet Details',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20), // Add some space
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   var name = data[index]['name'];
//                   print(name); // Print the value assigned to name
//                   return ListTile(
//                     title: Text(name),
//                     // Add more details as needed
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: bottomNavBar(),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: const Color(0xff95654E),
//           onPressed: () {
//             setState(() {
//               Navigator.of(context).pushReplacementNamed('sellPage');
//             });
//           },
//           child: const Icon(Icons.add, color: Colors.white),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       ),
//     );
//   }
//
//   Widget _buildImage(String imageUrl) {
//     return Image.network(
//       imageUrl,
//       fit: BoxFit.cover,
//     );
//   }
//
//   Widget _buildDropdown(
//       String label, List<String> items, String value, Function onChanged) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//       value: value,
//       items: items.map((item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: (newValue) => onChanged(newValue),
//     );
//   }
//
//   Widget bottomNavBar() {
//     return BottomNavigationBar(
//       selectedItemColor: const Color.fromARGB(255, 175, 130, 96),
//       unselectedItemColor: const Color.fromARGB(255, 50, 44, 43),
//       backgroundColor: const Color(0xffE3B68D),
//       currentIndex: _navIcon,
//       onTap: (index) {
//         setState(() {
//           _navIcon = index;
//         });
//         if (index == 0) {
//           index = 0;
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Homescreen()),
//           );
//         }
//         if (index == 1) {
//           index = 1;
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CategoriesScreen()),
//           );
//         }
//         if (index == 3) {
//           index = 3;
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => EmergencyScreen()),
//           );
//         }
//         if (index == 4) {
//           index = 4;
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ProfileScreen()),
//           );
//         }
//       },
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "home"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.category), label: "categories"),
//         BottomNavigationBarItem(icon: Icon(Icons.add), label: "sell"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.emergency_outlined), label: "emergency"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.perm_identity_outlined),
//           label: "profile",
//         ),
//       ],
//     );
//   }
//
//   PreferredSizeWidget appBar() {
//     return AppBar(
//       backgroundColor: const Color(0xffE3B68D),
//       title: Text(
//         'Your Selling Pet Details',
//         style: TextStyle(color: Color.fromARGB(255, 135, 87, 65)),
//       ),
//       centerTitle: true,
//       automaticallyImplyLeading: false,
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: SellItemCart(),
//   ));
// }
