import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/buttonAlert.dart';
import 'package:sqliteapp/database/event_database.dart';
import './BookedEvents.dart';
import '../../models/user.dart';
// import '../../models/event.dart';
import '../../components/randomNo.dart';
import '../../models/feedback.dart';
import 'package:url_launcher/url_launcher.dart';


class UserFeedback extends StatefulWidget {
  UserFeedback({Key? key, required this.user, required this.user_id, required this.event_id}) : super(key: key);

final int user_id;
  final int event_id;
  final User user;
  @override
  _UserFeedbackState createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  int? _id;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF6F35A5),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //
            }),
        title: Text("Feedback"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.solidStar),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Container(

      )
    );
  }
}


//  Center(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(60, 50, 60, 50),
//                 child: Container(
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: RaisedButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(50.0)),
//                       color: Colors.purple,
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {
//                         print(myFeedbackText);
//                         print(myFeedbackText1);
//                         print(myFeedbackText2);

//                         int _id = randomId(10000, 110000);
//                         var feedback = FeedbackC(
//                           id: _id,
//                           user_id: this.widget.user_id,
//                           event_id: this.widget.event_id,
//                           date: DateTime.now().millisecondsSinceEpoch,
//                           );
//                         EventDatabase.instance.insertFeedback(feedback);
//                         showBookAlertDialog(context, this.widget.user, "Feedback Done", "ThankYou For Your Kind Feedback" );
//                          EventDatabase.instance.updateStatus(this.widget.event_id, "Done");
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),