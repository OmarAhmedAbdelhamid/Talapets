import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talapets/buttons/my_textField.dart';
import 'package:talapets/buttons/sign_in_button.dart';
import '../buttons/Buttonsssss.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  VoidCallback showLoginPage;
  //backend
  RegisterPage({Key? key, this.showLoginPage = _defaultShowLoginPage});

  static void _defaultShowLoginPage() {
    // No operation, as this is a default value
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {
  //backend
  ////firestore info
  CollectionReference userinfo =
  FirebaseFirestore.instance.collection('userinfo');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return userinfo
        .add({
      "Username": usernamecontroller.text,
      "Email": emailcontroller.text,
      "Phone": confPhonenumber.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  /////end of firestore info
  final usernamecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confPhonenumber = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back75.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    width: 180,
                    height: 180,
                  ),
                ),
                const Text(
                  "Welcome to our Application",
                  style: TextStyle(
                    color: Color(0xff632B00),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: usernamecontroller,
                  hintText: 'Username',
                  obsecureText: false,
                  validator: (val){
                    if(val == ""){
                      // return "Can't be empty" ;
                    }
                    return "Can't be empty" ;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: emailcontroller,
                  hintText: 'Email',
                  obsecureText: false,
                  validator: (val){
                    if(val == ""){
                      // return "Can't be empty" ;
                    }
                    return "Can't be empty" ;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: passwordcontroller,
                  hintText: 'password',
                  obsecureText: true,
                  validator: (val){
                    if(val == ""){
                      // return "Can't be empty" ;
                    }
                    return "Can't be empty" ;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: confPhonenumber,
                  hintText: 'Phone Number',
                  obsecureText: false,
                  validator: (val){
                    if(val == ""){
                      // return "Can't be empty" ;
                    }
                    return "Can't be empty" ;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  title: 'Sign up',
                  onPressed: () async {
                    addUser();
                    if(formState.currentState!.validate()){
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(

                          email: emailcontroller.text,
                          password: passwordcontroller.text,

                        );


                        Navigator.of(context).pushReplacementNamed('login');
                      } on FirebaseAuthException catch (e) {
                        if (e.code== 'weak-password') {
                          print('The password is weak');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'The password is weak',
                            btnCancelOnPress: () {},
                          ).show();
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'The account already exists for that email.',
                            btnCancelOnPress: () {},

                          ).show();
                        }
                      } catch (e) {
                        print(e);
                      }
                    }

                  },
                  disable: false,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.5,
                          color: Color(0xff632B00),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Color(0xff632B00),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.5,
                          color: Color(0xff632B00),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SignButton(
                  onTap: widget.showLoginPage,
                ),
              ]),),

            ),
          ),
        ));
  }
}
