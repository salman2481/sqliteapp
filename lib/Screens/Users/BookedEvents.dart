//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/components/randomNo.dart';
import 'package:sqliteapp/database/event_database.dart';
import 'package:sqliteapp/models/event.dart';
import 'package:sqliteapp/models/feedback.dart';
import './payment.dart';
import './feedback.dart';
import '../../components/drawer.dart';
import '../../models/user.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookedEvent extends StatefulWidget {
  BookedEvent({this.user});

  final User user;

  @override
  _BookedEventState createState() => _BookedEventState();
}

class _BookedEventState extends State<BookedEvent> {
  Future<List<Events>> _listFuture;
  @override
  void initState() {
    super.initState();
    // initial load
    //TODO get payments from database
    _listFuture = EventDatabase.instance.getUsersEvents(this.widget.user.id);
  }

  void getData() async {
    EventDatabase.instance.getUsersEvents(this.widget.user.id).then((items) {
      setState(() {
        _listFuture = items as Future<List<Events>>;
      });
    });
  }

  //alert dialogue box
  showAlertDialog(BuildContext context, int id) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        EventDatabase.instance.deleteEvent(id);
        EventDatabase.instance.deletePayment(id);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BookedEvent(
              user: this.widget.user,
            );
          },
        ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Confirm Cancellation!")),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      content: Text("Do you really want to cancel the event?"),
      actions: [
        cancelButton,
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        drawer: Sidebar(this.widget.user),
        appBar: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Center(
              child: Text('Booked Events',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            )),
        body: FutureBuilder<List>(
          future: _listFuture,
          initialData: List(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int position) {
                 
                      statusDateChecker(snapshot.data[position].event_date, snapshot.data[position].id, snapshot.data[position].feedback_status);
                      
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 30,
                        color: Color(0xFF6F35A5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                    '''🎉 Event title             -->    ${snapshot.data[position].title}
 
🕑 daytime                -->    ${snapshot.data[position].daytime},
 
📆 event date            -->    ${snapshot.data[position].event_date},

👨 attendees             -->    ${snapshot.data[position].attendees},

💬 status                    -->    ${snapshot.data[position].feedback_status}
 
📦 type                    -->     ${snapshot.data[position].type} ''',
                                    style: TextStyle(color: Color(0xFFFFFFFF)),
                                    textAlign: TextAlign.left,
                                    maxLines: 15),
                              ),
                              SizedBox(height: 3),
                              Container(
                                width: screenSize.width * 0.8,
                                child: ListTile(
                                  title: (snapshot
                                              .data[position].feedback_status ==
                                          'Complete')
                                      ? ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFFFFFFFF)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.0),
                                                      side: BorderSide.none))),
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Text("Feedback",
                                                style: TextStyle(
                                                    color: Color(0xFF6F35A5),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          onPressed: () async {
                                            const url = 'https://docs.google.com/forms/d/e/1FAIpQLSdSKhbqk-y9AbdmTGnGmP1hf4xlUJaBtQCTHD78m5L8gIeo_Q/viewform?usp=sf_link';  

                                            if (await canLaunch(url)) {
                                              await launch(url, forceWebView: true,  enableJavaScript: true);
                                              print("feedback");
                                              print(snapshot.data[position].id);
                                              int _id = randomId(10000, 110000);
                                              var feedback = FeedbackC(
                                                id: _id,
                                                user_id: snapshot.data[position].user_id,
                                                event_id: snapshot.data[position].id,
                                                date: DateTime.now().millisecondsSinceEpoch,
                                                );
                                              EventDatabase.instance.insertFeedback(feedback);
                                              print("Inserted");
                                              EventDatabase.instance.updateStatus(snapshot.data[position].id, "Done");
                                            } else {
                                              throw 'Could not launch $url';
                                            
                                             }
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             (UserFeedback(
                                            //                 user: this
                                            //                     .widget
                                            //                     .user,
                                            //                 event_id: snapshot
                                            //                     .data[position]
                                            //                     .id,
                                            //                 user_id: snapshot
                                            //                     .data[position]
                                            //                     .user_id))));
                                          },
                                        )
                                      : (snapshot.data[position]
                                                  .feedback_status ==
                                              'Ongoing')
                                          ? ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFFFFFFFF)),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28.0),
                                                              side: BorderSide
                                                                  .none))),
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child: Text("Cancel",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F35A5),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              onPressed: () async {
                                                showAlertDialog(context,
                                                    snapshot.data[position].id);
                                              },
                                            )
                                          : SizedBox(
                                              height: 1,
                                            ),
                                ),
                              ),
                            ]),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}


void statusDateChecker(String date, int _id, String feedback_status) async {
  // var converted = date.split("/"); //month , day , year

  if(feedback_status == "Done"){
    print("already recorded feedback");
  }else{

   final now = DateTime.now();
    DateTime current = DateTime(now.year, now.month, now.day);
   var event_date = DateFormat('M/d/yyyy').parse(date);
   
   if(event_date.compareTo(current) < 0 ){
    //  print("this date has passed");
     EventDatabase.instance.updateStatus(_id, "Complete");
   }else{
     //EventDatabase.instance.updateStatus(_id, "Ongoing");
     print("this is upcoming date not passed");
   }
  }

}
