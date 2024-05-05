import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talapets/screens/categoriesScreen.dart';
import 'package:talapets/screens/emergencyScreen.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'package:talapets/screens/profile.dart';

class PetSalesPage extends StatefulWidget {
  @override
  _PetSalesPageState createState() => _PetSalesPageState();
}

class _PetSalesPageState extends State<PetSalesPage> {
  int _selectedAge = 0;
  String _selectedGender = 'Any';
  String _selectedLocation = 'Any';
  String _price = '';
  int _navIcon = 0;

  // List<String> _genders = ['Any', 'Male', 'Female'];
  // List<String> _locations = ['Any', 'alex', 'cairo', 'giza'];

  CollectionReference sellpet =
  FirebaseFirestore.instance.collection('sellpet');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return sellpet
        .add({
      "Price": sellpetController.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  final sellpetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<int> _ages = List.generate(
        61, (index) => index); // Numeric age range 0 to 60 months (5 years)

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back75.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                child: PageView(
                  children: [
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 1
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 2
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 3
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Pet',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 28,
                      ),
                      labelText: 'Animal Type',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType:
                    TextInputType.number, // Allow only numeric input
                    onChanged: (value) {
                      setState(() {
                        _price = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 28,
                      ),
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType:
                    TextInputType.number, // Allow only numeric input
                    onChanged: (value) {
                      setState(() {
                        _price = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 28,
                      ),
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType:
                    TextInputType.number, // Allow only numeric input
                    onChanged: (value) {
                      setState(() {
                        _price = value;
                      });
                    },
                  ),
                ),
              ],
            ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    addUser();

                    // Handle sell button press
                  },
                  //button style
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Color(0xff95654E),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Sell Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff95654E),
          onPressed: () {
            setState(() {
              Navigator.of(context).pushReplacementNamed('sellPage');
            });
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String value, Function onChanged) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (newValue) => onChanged(newValue),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 175, 130, 96),
      unselectedItemColor: const Color.fromARGB(255, 50, 44, 43),
      backgroundColor: const Color(0xffE3B68D),
      currentIndex: _navIcon,
      onTap: (index) {
        setState(() {
          _navIcon = index;
        });
        if (index == 0) {
          index = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        }
        if (index == 1) {
          index = 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesScreen()),
          );
        }
        if (index == 3) {
          index = 3;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmergencyScreen()),
          );
        }
        if (index == 4) {
          index = 4;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: "categories"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "sell"),
        BottomNavigationBarItem(
            icon: Icon(Icons.emergency_outlined), label: "emergency"),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_outlined),
          label: "profile",
        ),
      ],
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: const Color(0xffE3B68D),
      title: Text(
        'Your Selling Pet Details',
        style: TextStyle(color: Color.fromARGB(255, 135, 87, 65)),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PetSalesPage(),
  ));
}