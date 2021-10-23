//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/models/event.dart';
import '../models/user.dart';
import 'Signup.dart';
import 'Users/home.dart';
import '../database/event_database.dart';
import './Admin/home.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: screenSize.height * 0.35,
            ),
            SizedBox(height: screenSize.height * 0.03),
            Container(
              width: screenSize.width * 0.8,
              child: ListTile(
                title: TextField(
                  onChanged: (value) => username = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    hintText: 'username',
                    filled: true,
                    fillColor: Color(0xFFF1E6FF),
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5)),
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.8,
              child: ListTile(
                title: TextField(
                  onChanged: (value) => password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    hintText: 'password',
                    filled: true,
                    fillColor: Color(0xFFF1E6FF),
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF6F35A5)),
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.8,
              child: ListTile(
                  title: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF6F35A5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide.none))),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  // EventDatabase.instance.delete();
                  Future<List<Events>> res = EventDatabase.instance.getEvents();
                  print(res);
                  print(username);
                  print(password);
                   User response =
                      await EventDatabase.instance.validateUser(username, password);

                  if (response != null) {
                    print("user exist");
                    print(response);
                    if(username=='admin')
                    { 
                      print("I am Admin");
                       Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminHome(user: response,);
                      },
                    ));
                      
                    }else{
                      print("I am Customer");
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UserHome(user: response,);
                      },
                    ));
                  
                  }}
                },
              )),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an Account ? ",
                  style: TextStyle(color: Color(0xFF6F35A5)),
                ),
                GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF6F35A5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async  {
                       String msg = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp()
                        ),
                      );

                    scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor:
                           Colors.green, content: Text(msg)));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
