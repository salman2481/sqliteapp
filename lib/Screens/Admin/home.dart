//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/Screens/Users/BookEvent/BookEvent.dart';
import '../login.dart';
import '../../components/drawer.dart';
import '../../models/user.dart';
import './BookedEvents.dart';

class AdminHome extends StatefulWidget {
AdminHome({this.user});

  final User user;
  @override
  _AdminHomeState createState() => new _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(backgroundColor:Color(0xFF6F35A5),title:Center(child:Text('Admin Portal'))),
      drawer: Sidebar(this.widget.user),
        body: AdminBookedEvent(user: this.widget.user));
  }
}


