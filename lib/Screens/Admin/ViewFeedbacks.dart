//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/database/event_database.dart';
import '../../models/feedback.dart';
import '../../models/user.dart';
import '../../components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class ViewFeedback extends StatefulWidget {
  ViewFeedback({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ViewFeedbackState createState() => _ViewFeedbackState();
}

class _ViewFeedbackState extends State<ViewFeedback> {
  // DateTime  date=DateTime.now();
  // int convertedDate;
  // final convertedDate=date!.millisecondsSinceEpoch;

  Future<List<dynamic>> _listFuture;
  @override
  void initState() {
    super.initState();
    // initial load
    _listFuture = EventDatabase.instance.getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Center(child: Text('Feedbacks'))),
        drawer: Sidebar(this.widget.user),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FutureBuilder(
                  future: _listFuture,
                  builder: (context, consumer) {
                    if (consumer.hasData) {
                      return DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                            "User ID",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )), //First Name
                          DataColumn(
                              label: Text(
                            "Event ID",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                        rows: [
                          ...consumer.data.map((var cons) => DataRow(cells: [
                                DataCell(Text('${cons.user_id}')),
                                DataCell(Text('${cons.event_id}')),
                                DataCell(Text('${DateTime.fromMillisecondsSinceEpoch(cons.date).toString().substring(0,10)}')),
                              ]))
                        ],
                      );
                    } else if (consumer.hasError) {
                      return Text("Error: ${consumer.error}");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 20, 0, 0),
                child: new ElevatedButton(
                    child: const Text(
                      'Generate Feedback',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF6F35A5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0))),
                    onPressed: () async {
                      await launch(
                          "https://docs.google.com/forms/d/e/1FAIpQLSdSKhbqk-y9AbdmTGnGmP1hf4xlUJaBtQCTHD78m5L8gIeo_Q/viewanalytics");
                    }),
              ),
            ]),));
  }
}
