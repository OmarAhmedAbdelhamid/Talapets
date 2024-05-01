import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed("homepage");
        //     context,
        //     MaterialPageRoute(builder: (context) {
        //       return const Homescreen();
        //     }),
        //   );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(100, 41, 15, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
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
