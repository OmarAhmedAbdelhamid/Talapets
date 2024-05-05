import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talapets/screens/authentication.dart';
import 'package:talapets/screens/categoriesScreen.dart';
import 'package:talapets/screens/editProfileScreen.dart';
import 'package:talapets/screens/emergencyScreen.dart';
import 'package:talapets/screens/homeScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double _fontSize = 25;
  int _navIcon = 0;

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
          appBar: AppBar(
            backgroundColor: const Color(0xffE3B68D),
            title: Image.asset(
              "assets/images/logo.png",
              height: 60,
              width: 180,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/profile.png'),
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
                buildCard(Icons.phone_iphone, "+8181234567", _fontSize),
                lineMaker(),
                buildCard(
                    Icons.email_outlined, "username@gmail.com", _fontSize),
                lineMaker(),
                buildCard(Icons.cake_outlined, "25/10/2002", _fontSize),
                lineMaker(),
                buildCard(Icons.male, "Male", _fontSize),
                lineMaker(),
                buildCard(
                    Icons.location_on_outlined,
                    "6W49+PJC, Al Azaritah WA Ash Shatebi, Bab Sharqi, Alexandria Governorate",
                    20),
                lineMaker(),
                buildCard(Icons.credit_card, "**** **** **** *785", _fontSize),
                lineMaker(),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context,
                            ) {
                          return const EditProfile();
                        }));
                      },
                      child: const Text('Edit Profile',
                          style: TextStyle(fontSize: 20, fontFamily: 'Caveat')),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff95654E),
                          foregroundColor: Colors.white,
                          fixedSize: Size(170, 60)),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context,
                            )
                        {
                          return AuthScreen();
                        }));
                      },
                      child: const Text('Log-Out',
                          style: TextStyle(fontSize: 20, fontFamily: 'Caveat')),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff95654E),
                          foregroundColor: Colors.white,
                          fixedSize: Size(170, 60)),
                    ),
                    Spacer(),
                  ]),
                )
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
      ),
    );
  }

  Widget lineMaker() {
    return Divider(
      color: const Color(0xff95654E),
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
            color: Color(0xff652B14),
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
}
