//@dart=2.9
import 'package:flutter/material.dart';
import '../../components/drawer.dart';
import './BookEvent/BookEvent.dart';
import '../../models/user.dart';
import '../../components/data.dart';

class UserHome extends StatefulWidget {
  UserHome({Key key, this.user}) : super(key: key);

  final User user;
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Center(
              child: Text('Packages',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            )),
        body: ListView(
          children: <Widget>[
            Card(
              color: Color(0xFF6F35A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: 6.0, right: 4.0, bottom: 6.0),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://mk0wedomentsg8gk1yo0.kinstacdn.com/wp-content/uploads/2020/08/wedding-venue-2-1-300x300.png',
                        height: 50,
                        width: 50,
                      ),
                      Text('  Wedding Package',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://media.giphy.com/media/hVOFiEEo9HEljGuy4W/giphy.gif'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      )),
                      child: Center(
                        child: Text(
                          '''In  this package, you will get (Note this package will applicable for minimum 300 guests)
• Complete setup (Crockery, cutlery, waiters, wall to wall carpet, canopy etc)
• Customized and Elegant decor plan as per the theme
• Food ( one dish Mutton Menu)
• Cold drink and Mineral water are included.
• D.j system with a professional operator
• V.i.p lounges for 80 persons
• Generator with fuel
• Trussing system with complete hanging garden.
All is this in just Rs. 2150/- Per head

''',
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
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
                                MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide.none))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6F35A5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (BookEvent(
                                      user: this.widget.user,
                                      price: service["Wedding"],
                                      type: "Wedding",
                                      ))));
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFF6F35A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: 6.0, right: 1.0, bottom: 6.0),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://image.flaticon.com/icons/png/512/2905/2905024.png',
                        height: 50,
                        width: 50,
                      ),
                      Text(' Engagement Package',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://media.giphy.com/media/f9lBQ3v6pJucocCJ8q/giphy.gif'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      )),
                      child: Center(
                        child: Text(
                          ''' In  this package, you will get (Note this package will  applicable for minimum 300 guests).
• Complete setup (Crockery, cutlery, waiters, wall to   wall carpet, canopy etc).
• Customized and Elegant decor plan as per the   theme.
• hashCode ( one-dish chicken Menu)/nCold drink and  Mineral water are included.
• D.j system with a professional operator.
• hashCode lounges for 60 persons.
• Generator with fuel.
• Trussing system with complete hanging garden.
All is this in just Rs. 1650/- Per head
''',
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
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
                                MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide.none))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6F35A5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (BookEvent(
                                      user: this.widget.user,
                                      price: service["Engagement"],
                                      type: "Engagement",))));
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFF6F35A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: 6.0, right: 4.0, bottom: 6.0),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://image.flaticon.com/icons/png/512/864/864763.png',
                        height: 50,
                        width: 50,
                      ),
                      Text('  Birthday Package',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://media.giphy.com/media/l4KihuqeuJEi9qLSM/giphy.gif'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      )),
                      child: Center(
                        child: Text(
                          '''In this package, we are offering services on a wide scale. 
• Customized Stage Backdrop with Theme Character Cutout/Printed Stuff
• Customized Theme Balloon’s Stage Arch + Entrance Balloon Arch
• Customized Balloon’s Area Decor + Selective Floral Decor
• Customized Cake Table Luxury Decor with selective ideas
• Customized Theme Character Cutouts for Cake Table Front & Area Display
• Name’s Initial Cutout for Entrance Display
• 25 – 35 person’s Sitting plan only
• Jumping Castle for Kids’ Enjoyment
• 2 Selective Cartoon Character/Colons
Bravo Birthday Package … Starting From 1000/- per head Only
''',
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
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
                                MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide.none))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6F35A5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (BookEvent(
                                      user: this.widget.user,
                                      price: service["Birthday"],
                                      type: "Birthday",))));
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFF6F35A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: 6.0, right: 4.0, bottom: 6.0),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://image.flaticon.com/icons/png/512/1376/1376508.png',
                        height: 50,
                        width: 50,
                      ),
                      Text('  Conference Package',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://media.giphy.com/media/1QZlUM9AHrfOTL2vwZ/giphy.gif'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      )),
                      child: Center(
                        child: Text(
                          ''' In  this package, you will get (Note this package will  applicable for minimum 100 guests).
• Complete setup (wall to wall carpet, canopy, internet access etc).
• Customized and Elegant decor plan as per the   theme.
• Cold drink, lunch and  Mineral water are included.
• lounges for 50 persons.
• Generator with fuel.
• Exhibition Area.
• Best Sound System.
All is this in just Rs. 2000/- Per head
''',
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
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
                                MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide.none))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6F35A5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (BookEvent(
                                      user: this.widget.user,
                                      price: service["Conference"],
                                      type: "Conference",))));
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFF6F35A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 30,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: 6.0, right: 4.0, bottom: 6.0),
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://image.flaticon.com/icons/png/512/2145/2145288.png',
                        height: 50,
                        width: 50,
                      ),
                      Text('  Seminar Package',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://thumbs.gfycat.com/OldfashionedAdoredIncatern-max-1mb.gif'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      )),
                      child: Center(
                        child: Text(
                          ''' In  this package, you will get (Note this package will  applicable for minimum 250 guests).
• Complete setup (tables,chairs,mikes,speakers).
• Customized and Elegant decor plan as per the theme.
• the welcome coffee, lunch ,Cold drink, afternoon cake.and  Mineral water are included.
• Best Audio system.
• lounges for 300 persons.
• Generator with fuel.
All is this in just Rs. 1500/- Per head
''',
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
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
                                MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide.none))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6F35A5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (BookEvent(
                                      user: this.widget.user,
                                      price: service["Seminar"],
                                      type: "Seminar",))));
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: Sidebar(this.widget.user));
  }
}
