import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
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
          child: Text(
            "Sign In",
            style: TextStyle(
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
