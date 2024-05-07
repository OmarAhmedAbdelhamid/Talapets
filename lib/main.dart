import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talapets/screens/Sell.dart';
import 'package:talapets/screens/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talapets/screens/register_page.dart';
import 'package:talapets/screens/login_page.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talapets/screens/Sellitemcart.dart';
//backend code
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TalaPets());
}

class TalaPets extends StatefulWidget {
  const TalaPets({Key? key});

  @override
  State<TalaPets> createState() => _TalaPetsState();
}

//backend code
class _TalaPetsState extends State<TalaPets> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Use initialRoute instead of home for specifying the initial route
      initialRoute: FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified
          ? "homepage"
          : "login",
      routes: {
        "signup": (context) => RegisterPage(),
        "login": (context) => LoginPage(showRegisterPage: () {  },),
        "homepage": (context) => Homescreen(),
        // "PetSalesPage": (context) => PetSalesPage(),
        "sellPage": (context) => PetSalesPage(),
        "sellItemCart": (context) => SellItemCart(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}