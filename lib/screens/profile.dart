import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talapets/screens/Sell.dart';
import 'package:talapets/screens/authentication.dart';
import 'package:talapets/screens/categoriesScreen.dart';
import 'package:talapets/screens/editProfileScreen.dart';
import 'package:talapets/screens/emergencyScreen.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'delete_account.dart';

void main() {
  runApp(const ProfileScreen());
}

bool _isLoggedIn = false;
String? Username; // Variable to store the first name retrieved from Firestore
String? email;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {
    super.initState();
    _checkLoginStatus();
    _fetchUserData();
  }

  void _checkLoginStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isLoggedIn = user != null;
      });
    });
  }

  void _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('userinfo')
          .doc(user.uid)
          .get();

      setState(() {
        Username = snapshot.data()?['Phone'];
        email = user.email;
      });
    } else {
      setState(() {
        email = null;
      });
    }
  }

  double _fontSize = 25;
  int _navIcon = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back75.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    color: const Color(0xff652B14),
                    fontSize: 40,
                    fontFamily: 'Caveat',
                  ),
                ),
                lineMaker(),
                buildCard(Icons.phone_iphone, '$Username', _fontSize),
                lineMaker(),
                buildCard(
                    Icons.email_outlined, "username@gmail.com", _fontSize),
                if (email != null) ...[
                  SizedBox(height: 15),
                  Text(
                    '$email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
                lineMaker(),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 12.0, right: 24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (
                                context,
                              ) {
                                return const EditProfile();
                              }));
                            },
                            child: const Text('Edit Profile',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Caveat')),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff632B00),
                                foregroundColor: Colors.white,
                                fixedSize: Size(110, 60)),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (
                                context,
                              ) {
                                return AuthScreen();
                              }));
                            },
                            child: const Text('Log-Out',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Caveat')),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff632B00),
                                foregroundColor: Colors.white,
                                fixedSize: Size(110, 60)),
                          ),
                          Spacer(),
                          DeleteAccountButton()
                        ]),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: bottomNavBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff95654E),
            onPressed: () {          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetSalesPage()),
            );},
            child: const Icon(Icons.add, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget lineMaker() {
    return Divider(
      color: Color.fromARGB(255, 140, 84, 58),
      thickness: 3,
      height: 7,
    );
  }

  Widget buildCard(IconData icon, String text, double fontSize) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: const Color(0xff000000),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Caveat',
            color: Color.fromARGB(255, 62, 27, 1),
          ),
        ),
      ),
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
        if (index == 2) {
          index = 2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetSalesPage()),
          );
        }
        if (index == 3) {
          index = 3;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmergencyScreen()),
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
      title: Image.asset(
        "assets/images/logo.png",
        height: 80,
        width: 180,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
