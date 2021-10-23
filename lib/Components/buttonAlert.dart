import 'package:flutter/material.dart';
import '../models/user.dart';
import '../Screens/Users/home.dart';
//alert dialogue box
showBookAlertDialog(BuildContext context, User user, String s1, String s2) {
  // set up the buttons

  Widget continueButton = TextButton(
    child: Text("Okay"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return UserHome(
              user: user,
            );
          },
        ),
      );
    },
  );  //  

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text(s1)),
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
    content: Text(s2),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
