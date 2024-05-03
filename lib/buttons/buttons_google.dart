import 'package:flutter/material.dart';

class Buttongoogle extends StatelessWidget {
  const Buttongoogle(
      {Key? key,
        required this.title,
        required this.onPressed,
        required this.disable})
      : super(key: key);

  final String title;
  final bool disable;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            backgroundColor: Color(0xff63280D),
            foregroundColor: Colors.white,
          ),
          onPressed: disable ? null : onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login With Google"),
                Container(width: 5,),
                Image.asset('assets/images/google_icon.png',width: 30,)
              ],
            ),

        ),
      ),
    );
  }
}
