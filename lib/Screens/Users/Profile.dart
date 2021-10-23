//@dart=2.9
import 'package:flutter/material.dart';
import  './home.dart';
import '../login.dart';
import '../../models/user.dart';
import '../../components/drawer.dart';

class UserProfile extends StatefulWidget {
  UserProfile({this.user});

  final User user;
  @override
  _UserProfileState createState() => new _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(backgroundColor:Color(0xFF6F35A5)),
      drawer: Sidebar(this.widget.user),
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.deepPurple.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image:AssetImage('assets/images/avatar1.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 50.0),
                Padding(padding:EdgeInsets.fromLTRB(50,0,0,0),
                child:Text(
                  this.widget.user.name,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                )),
                SizedBox(height: 10.0),
                Padding(
                  padding:EdgeInsets.fromLTRB(120,0,0,0),  
                child:ListTile(title:Text(
                  this.widget.user.email,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                )),
                Padding(
                  padding:EdgeInsets.fromLTRB(120,0,0,0),  
                child:ListTile(title:Text(
                  this.widget.user.contact,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                )),
              
                    SizedBox(height: 25.0),
                  Padding(
                    padding:EdgeInsets.fromLTRB(40,0,0,0),
                child:Container(
                    height: 50.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Color(0xFF6F35A5),
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Login())));
                        },
                        child: Center(
                          child: Text(
                            'Log out',
                           style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    )))
              ],
            ))
      ],
           ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}