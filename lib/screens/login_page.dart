import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talapets/buttons/my_reg_button.dart';
import 'package:talapets/buttons/my_textField.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../buttons/Buttonsssss.dart';
import '../buttons/buttons_google.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({Key? key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Image(
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                        width: 180,
                        height: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Welcome back you have been missed !",
                      style: TextStyle(
                        color: Color(0xff632B00),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obsecureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obsecureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     InkWell(
                       onTap: () async{
                         if(emailController.text == ""){
                           AwesomeDialog(
                             context: context,
                             dialogType: DialogType.error,
                             animType: AnimType.rightSlide,
                             title: 'No email detected',
                             desc: 'Please insert your email',

                           ).show();
                           return;
                           /////////////////////////////////////////////////
                         }
                         try{
                           await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);

                           AwesomeDialog(
                             context: context,
                             dialogType: DialogType.error,
                             animType: AnimType.rightSlide,
                             title: 'Your email is not found',
                             desc: 'Please insert your correct email',
                           ).show();
                         }catch(e){

                         }



                         AwesomeDialog(
                           context: context,
                           dialogType: DialogType.success,
                           animType: AnimType.rightSlide,
                           title: 'Password Reset link sent',
                           desc: 'Check you email address so you can change your password',
                           btnOkOnPress: () {},
                         ).show();
                       },
                       child: Container(
                         padding: EdgeInsets.only(right: 45),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Color(0xff632B00),
                                fontSize: 16,
                              ),
                            ),
                          ],
                         ),
                       ),
                     ),
                    Button(
                      title: 'Log-in',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final userCredential =
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            final user = userCredential.user;
                            if (user != null) {
                              if (user.emailVerified) {
                                Navigator.of(context).pushReplacementNamed('homepage');
                              } else {
                                // Email not verified
                                FirebaseAuth.instance.currentUser!.sendEmailVerification();//send verifcation link to gmail
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.rightSlide,
                                  title: 'Please verify your email address',
                                  desc: 'You\'re almost set to start using this app , check your email address and verify',
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            }
                            //write wrong password or email
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-credential') {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Email or password incorrect',
                                btnCancelOnPress: () {},
                              ).show();

                            } else {
                              print('Error: ${e.code}');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Login failed: ${e.message}',
                                btnCancelOnPress: () {},
                              ).show();
                            }
                          }
                        }
                      },
                      disable: false,
                    ),
                    //Google sign in
                    Buttongoogle(
                      title: 'Log-in with google ',
                      onPressed: () async {


                        // Trigger the authentication flow
                        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                        if (googleUser == null){
                          return; // if i decided to click on screen without log in it will stop here
                        }

                        // Obtain the auth details from the request
                        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                        // Create a new credential
                        final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth?.accessToken,
                          idToken: googleAuth?.idToken,
                        );

                        // Once signed in, return the UserCredential
                         await FirebaseAuth.instance.signInWithCredential(credential);

                         Navigator.of(context).pushReplacementNamed('homepage');


                        }, disable: false,
                    ),



                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 45.0,
                      ),

                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                              'Don\'t have an account?',
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
                    MyRegButton(
                      onTap: widget.showRegisterPage,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
