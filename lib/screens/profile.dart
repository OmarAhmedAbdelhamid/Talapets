import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talapets/screens/authentication.dart';
import 'package:talapets/screens/editProfileScreen.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'package:flutter/src/material/ink_well.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double _fontSize = 25;

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
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (
                  context,
                ) {
                  return const Homescreen();
                }));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
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
                InkWell(
                  child: Container(
                      child: buildCard(Icons.credit_card, "Delete account", _fontSize)),

                ),

                buildCard(Icons.credit_card, "Delete account", _fontSize),

                lineMaker(),


                Padding(
                  padding: const EdgeInsets.only(top: 70),
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
                      onPressed: () async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        googleSignIn.disconnect(); // to sign out from google and choose another acc
                        await FirebaseAuth.instance.signOut(); // sign out
                        Navigator.push(context, MaterialPageRoute(builder: (
                          context,
                        ) {
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
        ),
      ),
    );
  }

/*                      onPressed: () {
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
                    ), */
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
}
