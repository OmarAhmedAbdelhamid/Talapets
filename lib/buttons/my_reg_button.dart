import 'package:flutter/material.dart';

class MyRegButton extends StatefulWidget {
  
  final Function()? onTap;

  const MyRegButton({super.key, required this.onTap});

  @override
  State<MyRegButton> createState() => _MyRegButtonState();
}

class _MyRegButtonState extends State<MyRegButton> {
  @override
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
          Navigator.of(context).pushReplacementNamed("signup");
        },
    //   onTap:() async {try {
    // final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    // email: email.text,
    // password: password.text,
    // );
    // } on FirebaseAuthException catch (e) {
    // if (e.code == 'weak-password') {
    // print('The password provided is too weak.');
    // } else if (e.code == 'email-already-in-use') {
    // print('The account already exists for that email.');
    // }
    // } catch (e) {
    // print(e);
    // }},
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 85),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(100, 41, 15,1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child:
          Text(
            "Register now"
              ,style: TextStyle(
          color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}