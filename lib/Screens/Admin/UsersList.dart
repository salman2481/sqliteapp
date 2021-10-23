//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/database/event_database.dart';
import '../../Components/alertD.dart';
import '../../models/event.dart';
import '../../models/user.dart';
import '../../components/drawer.dart';

class ViewUsers extends StatefulWidget {
  ViewUsers({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  Future<List<dynamic>> _listFuture;
  @override
  void initState() {
    super.initState();
    // initial load
    _listFuture = EventDatabase.instance.getAllUsers();
  }

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
        EventDatabase.instance.deleteUser(id);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ViewUsers(
              user: this.widget.user,
            );
          },
        ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Confirm Deletion!")),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      content: Text("Do you really want to delete the User?"),
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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Center(child: Text('Registered Users'))),
        drawer: Sidebar(this.widget.user),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                padding: EdgeInsets.all(16),
                child: FutureBuilder(
                    future: _listFuture,
                    builder: (context, users) {
                      if (users.hasData) {
                        return DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                              "User ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Username",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )), //First Name
                            DataColumn(
                                label: Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Contact",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                              label: Text(
                                "Action",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: [
                            ...users.data.map((var user) => DataRow(cells: [
                                  DataCell(Text('${user.id}')),
                                  DataCell(Text('${user.username}')),
                                  DataCell(Text('${user.name}')),
                                  DataCell(Text('${user.email}')),
                                  DataCell(Text('${user.contact}')),
                                  DataCell(Text('${user.address}')),
                                  DataCell(Text('${user.status}')),
                                  DataCell(ElevatedButton(
                                    child: Text("Delete"),
                                    onPressed: () {
                                      showAlertDialog(context, user.id);
                                      print("I was Clicked");
                                    },
                                  ))
                                ]))
                          ],
                        );
                      } else if (users.hasError) {
                        return Text("Error: ${users.error}");
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }))));
  }
}
