import 'package:flutter/material.dart';
import 'package:talapets/screens/categoriesScreen.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'package:talapets/screens/profile.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
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
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Best Care For Your Pets",
                  style: TextStyle(
                    color: Color.fromARGB(255, 73, 32, 0),
                    fontSize: 40,
                    fontFamily: 'Caveat',
                  ),
                ),
                buildCard(
                    icon: Image.asset('assets/icons/hos.png'),
                    title: "Pet Hospital",
                    text: "Dr. Vet Clinic"),
                lineMaker(),
                buildCard(
                    icon: Icon(
                      Icons.phone_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: "Phone Number",
                    text: "+20 100 969 8210"),
                lineMaker(),
                buildCard(
                    icon: Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: "Pet Hospital Mail",
                    text: "dimitrymina@yahoo.com"),
                lineMaker(),
                buildCard(
                    icon: Image.asset('assets/icons/phrm.png'),
                    title: "Pet Pharmacy",
                    text: "Do well Vet Pharmacy"),
                lineMaker(),
                buildCard(
                    icon: Icon(
                      Icons.phone_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: "Pet Pharmacy Phone Number",
                    text: "+20 105 050 7217"),
                lineMaker(),
                buildCard(
                    icon: Image.asset('assets/icons/amb.png'),
                    title: "Vet Ambulance Emergency",
                    text: "+20 127 913 3936"),
              ],
            ),
          ),
          bottomNavigationBar: bottomNavBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff95654E),
            onPressed: () {},
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
      color: const Color(0xff95654E),
      thickness: 3,
      height: 7,
    );
  }

  Widget buildCard({Widget? icon, String? title, String? text}) {
    return Card(
      color: const Color(0xff632B00),
      child: ListTile(
        leading:
        icon != null ? SizedBox(child: icon, width: 35, height: 35) : null,
        title: Column(
          children: [
            if (title != null)
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Caveat',
                  color: Colors.white,
                ),
              ),
            if (text != null)
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Caveat',
                  color: Colors.white,
                ),
              ),
          ],
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
        if (index == 1) {
          index = 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesScreen()),
          );
        }
        if (index == 0) {
          index = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
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