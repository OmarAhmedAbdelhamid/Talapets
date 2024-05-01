// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'Buttonsssss.dart';
//
// class SignUpButton extends StatefulWidget {
//   final Function()? onTap;
//
//   const SignUpButton({super.key, required this.onTap});
//
//   @override
//   State<SignUpButton> createState() => _SignUpButtonState();
// }
// sahdbashdbhasbdkd@gmail.com
// class _SignUpButtonState extends State<SignUpButton> {
//   @override
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () {
//       //   Navigator.of(context).pushReplacementNamed("homepage");
//       //   },
//       // onTap:() async {
//       // try {
//       //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       //     email: email.text,
//       //     password: password.text,
//       //   );
//       // } on FirebaseAuthException catch (e) {
//       //   if (e.code == 'weak-password') {
//       //     print('The password provided is too weak.');
//       //   } else if (e.code == 'email-already-in-use') {
//       //     print('The account already exists for that email.');
//       //   }
//       // } catch (e) {
//       //   print(e);
//       // }},
//
//       // onTap: widget.onTap,
//       child: Container(
//     child: Button(
//       width: double.infinity,
//     title: 'Sign up',
//     onPressed: () async {
//     try {
//       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email.text,
//         password: password.text,
//       );
//
//     Navigator.of(context).pushReplacementNamed('homepage');
//     } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//     }
//     } catch (e) {
//     print(e);
//     }
//     },
//     disable: false),
//
//       ));
//   }}
//
//
//
//
//         // padding: const EdgeInsets.all(18),
//         // margin: const EdgeInsets.symmetric(
//         //   horizontal: 35,
//         // ),
//         // decoration: BoxDecoration(
//         //   color: const Color.fromRGBO(100, 41, 15, 1),
//         //   borderRadius: BorderRadius.circular(50),
//         // ),
//         // child: const Center(
//         //   child: Text(
//         //     "Register",
//         //     style: TextStyle(
//         //       color: Colors.white,
//         //       fontWeight: FontWeight.bold,
//         //       fontSize: 18,
//         //     )
//     //       ),
//     //     ),
//     //   ),
//
