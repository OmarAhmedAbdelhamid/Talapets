import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talapets/screens/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talapets/screens/register_page.dart';
import 'package:talapets/screens/login_page.dart';
import 'package:talapets/screens/homeScreen.dart';
//backend code
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const TalaPets());
}

class TalaPets extends StatefulWidget {
  const TalaPets({super.key});

  @override
  State<TalaPets> createState() => _TalaPetsState();
}

//backend code
class _TalaPetsState extends State<TalaPets> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('+++++++++++++++++++++++++++++++++++++++++++++++++++++User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
      //backend
      routes: {"signup": (context) => RegisterPage(),
      "login":(context) => LoginPage(),
        "homepage":(context) => Homescreen(),
      },


      debugShowCheckedModeBanner: false,
    );
  }
}
