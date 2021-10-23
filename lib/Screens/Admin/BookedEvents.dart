//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/database/event_database.dart';
import '../../Components/alertD.dart';
import '../../models/event.dart';
import '../../models/user.dart';
import '../../components/drawer.dart';

class AdminBookedEvent extends StatefulWidget {
  AdminBookedEvent({Key key, this.user}): super(key: key);

  final User user;


  @override
  _AdminBookedEventState createState() => _AdminBookedEventState();
}

class _AdminBookedEventState extends State<AdminBookedEvent> {
  Future<List<dynamic>> _listFuture;
    @override
  void initState() {
    super.initState();
    // initial load
    _listFuture= EventDatabase.instance.getEvents();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.all(16),
            child: FutureBuilder(
                future: _listFuture,
                builder: (context, event) {
                  if (event.hasData) {
                     return DataTable(
                      columns: [
                        DataColumn(label: Text("User ID", style: TextStyle(fontWeight: FontWeight.bold),)), //First Name
                        DataColumn(label: Text("Event Time", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Event Title", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Status", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold),)),
                         DataColumn(label: Text("Attendees", style: TextStyle(fontWeight: FontWeight.bold),)),
                        //  DataColumn(label: Text("Action",  style: TextStyle(fontWeight: FontWeight.bold),),),
                      ],
                      rows: [
                          ...event.data.map((var cons) => 
                          DataRow(
                           cells: [
                            DataCell(Text('${cons.user_id}')),
                            DataCell(Text('${cons.daytime}')),
                            DataCell(Text('${cons.title}')),
                            DataCell(Text('${cons.feedback_status}')),
                            DataCell(Text('${cons.event_date}')),
                            DataCell(Text('${cons.attendees}')),
                            // DataCell(ElevatedButton(child: Text("Delete"), onPressed: () {print("I was Clicked");},))
                          ])
                          )
                      ],
                    );
                  } else if (event.hasError) {
                    return Text("Error: ${event.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }))
    )
    );
}
}
