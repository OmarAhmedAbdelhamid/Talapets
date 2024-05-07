import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class DeleteAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _showConfirmationDialog(context);
        },
        child: Text('Delete Account',
            style: TextStyle(fontSize: 20, fontFamily: 'Caveat')),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff632B00),
            foregroundColor: Colors.white,
            fixedSize: Size(110, 60))
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to delete your account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteAccount(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount(BuildContext context) async {
    try {
      // Delete the user's account
      await FirebaseAuth.instance.currentUser?.delete();
      // Navigate to a different screen or display a message
      Navigator.of(context).pushReplacementNamed('login');





    } catch (e) {


    }
  }
}
