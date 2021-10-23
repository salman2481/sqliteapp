//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/Screens/Admin/UsersList.dart';
import '../Screens/Users/payment.dart';
import '../Screens/Users/BookEvent/BookEvent.dart';
import '../Screens/Users/home.dart';
import '../Screens/Users/BookedEvents.dart';
import '../Screens/Users/Profile.dart';
import '../Screens/login.dart';
import '../models/user.dart';
import '../Screens/Admin/BookedEvents.dart';
import '../Screens/Admin/profile.dart';
import '../Screens/Admin/home.dart';
import '../Screens/Admin/ViewFeedbacks.dart';

class Sidebar extends StatelessWidget {
  Sidebar(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: this.user.type == 'Customer'
          ? ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF6F35A5)),
                  accountName: Text(this.user.name),
                  accountEmail: Text(this.user.email),
                  currentAccountPicture: ClipOval(
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/55192319?v=4"),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Home"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (UserHome(
                                    user: this.user,
                                  ))));
                    }),
                Divider(
                  height: 10,
                  color: Colors.grey[400],
                ),
                ListTile(
                    leading: Icon(
                      Icons.event,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Booked Events"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (BookedEvent(
                                    user: this.user,
                                  ))));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.people,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  (UserProfile(user: this.user))));
                    }),
                Divider(
                  height: 6,
                  color: Colors.grey[400],
                ),
                ListTile(
                    // leading: Icon(Icons.document_scanner, color: Color(0xFF6F35A5),),
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (Login())));
                    }),
              ],
            )
          : ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF6F35A5)),
                  accountName: Text(this.user.name),
                  accountEmail: Text(this.user.email),
                  currentAccountPicture: ClipOval(
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/55192319?v=4"),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Home"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (AdminHome(
                                    user: this.user,
                                  ))));
                    }),
                Divider(
                  height: 10,
                  color: Colors.grey[400],
                ),
          
                ListTile(
                    leading: Icon(
                      Icons.event,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Registered Users"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (ViewUsers(
                                    user: this.user,
                                  ))));
                    }),
                    ListTile(
                    leading: Icon(
                      Icons.feedback,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Feedback"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (ViewFeedback(
                                    user: this.user,
                                  ))));
                    }),
                       ListTile(
                    leading: Icon(
                      Icons.people,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  (AdminProfile(user: this.user))));
                    }),

                Divider(
                  height: 6,
                  color: Colors.grey[400],
                ),
                ListTile(
                    // leading: Icon(Icons.document_scanner, color: Color(0xFF6F35A5),),
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xFF6F35A5),
                    ),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (Login())));
                    }),
              ],
            ),
    );
  }
}
