//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sqliteapp/database/event_database.dart';
import './BookEventAnimation.dart';
import 'package:string_validator/string_validator.dart';
import 'package:intl/intl.dart';
import '../payment.dart';
import '../../../components/alertD.dart';
import '../../../components/randomNo.dart';
import '../../../models/event.dart';
import '../../../models/user.dart';

class BookEvent extends StatefulWidget {
  BookEvent({Key key, this.user, this.price, this.type}) : super(key: key);

  final User user;
  final int price;
  final String type;

  @override
  _BookEventState createState() => _BookEventState();
}

enum eventTime { morning, evening }
enum decor { withDecor, withoutDecor }

class _BookEventState extends State<BookEvent> {
  final formKey = GlobalKey<FormState>();

  eventTime time = eventTime.morning;
  decor decorOption = decor.withDecor;
  String dateTime = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  String title;
  String attendees;
  int event_id;

  List<String> eventListTime = ["Morning", "Evening"];
  List<String> eventDecorTime = ["Yes", "No"];

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2022));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: new DecorationImage(
        image: AssetImage('assets/images/event.jpg'),
        fit: BoxFit.fitHeight,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                    1,
                    Padding(
                      padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
                      child: Text("Book Event",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.4,
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: formKey,
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          new Flexible(
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: TextFormField(
                                                    onChanged: (value) =>
                                                        title = value,
                                                    decoration: InputDecoration(
                                                        prefixIcon: const Icon(
                                                            Icons.assignment,
                                                            color: Color(
                                                                0xFF6F35A5)),
                                                        hintText:
                                                            'Enter Your Event Title',
                                                        labelText:
                                                            'Event Title',
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey[700]),
                                                        fillColor:
                                                            Color(0xFFF1E6FF),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2))),
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter some text';
                                                      }

                                                      if (!isAlpha(
                                                          value.replaceAll(
                                                              " ", ""))) {
                                                        return "Title contain only Alphabets";
                                                      }
                                                      if (value
                                                              .replaceAll(
                                                                  " ", "")
                                                              .length <
                                                          5) {
                                                        return 'Title length must be greater than or equal 5';
                                                      }
                                                      return null;
                                                    },
                                                  ))),
                                          new Flexible(
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                    10,
                                                    10,
                                                    10,
                                                    0,
                                                  ),
                                                  child: TextFormField(
                                                    onChanged: (value) =>
                                                        attendees = value,
                                                    decoration: InputDecoration(
                                                        prefixIcon: const Icon(
                                                            Icons
                                                                .person_outline,
                                                            color: Color(
                                                                0xFF6F35A5)),
                                                        hintText:
                                                            'Enter Number of Attendees',
                                                        labelText: 'Attendees',
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey[700]),
                                                        fillColor:
                                                            Color(0xFFF1E6FF),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2))),
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter some number';
                                                      }

                                                      if (!isNumeric(
                                                          value.replaceAll(
                                                              " ", ""))) {
                                                        return "Attendees Field contain only Digits";
                                                      }
                                                      if (int.parse(value) ==
                                                          0) {
                                                        return 'Attendees can not be zero';
                                                      }

                                                      return null;
                                                    },
                                                  )))
                                        ]),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 10, 10),
                                        child: Text(
                                          "Choose Event Time",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Radio(
                                            activeColor: Color(0xFF6F35A5),
                                            groupValue: time,
                                            value: eventTime.morning,
                                            onChanged: (eventTime val) {
                                              setState(() {
                                                time = val;
                                              });
                                            },
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 60, 0),
                                              child: Text('Morning')),
                                          Radio(
                                              activeColor: Color(0xFF6F35A5),
                                              groupValue: time,
                                              value: eventTime.evening,
                                              onChanged: (eventTime val) {
                                                setState(() {
                                                  time = val;
                                                });
                                              }),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 30, 0),
                                              child: Text('Evening'))
                                        ]),
                                    ListTile(
                                        title: TextFormField(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.date_range,
                                            color: Color(0xFF6F35A5),
                                          ),
                                          hintText: 'Enter Your Event Date',
                                          labelText: 'DD/MM/YY',
                                          filled: true,
                                          fillColor: Color(0xFFF1E6FF),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700]),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2))),
                                      controller: _dateController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Date';
                                        }

                                        return null;
                                      },
                                    )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 30, 10),
                                        child: Text(
                                          "With Decoration (Price Rs/-10000)",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Radio(
                                            activeColor: Color(0xFF6F35A5),
                                            groupValue: decorOption,
                                            value: decor.withDecor,
                                            onChanged: (decor val) {
                                              setState(() {
                                                decorOption = val;
                                              });
                                            },
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 60, 0),
                                              child: Text('Yes')),
                                          Radio(
                                              activeColor: Color(0xFF6F35A5),
                                              groupValue: decorOption,
                                              value: decor.withoutDecor,
                                              onChanged: (decor val) {
                                                setState(() {
                                                  decorOption = val;
                                                });
                                              }),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 40, 0),
                                              child: Text('No'))
                                        ]),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: new ElevatedButton(
                                          child: const Text(
                                            'Book',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF6F35A5),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 100,
                                                  vertical: 20),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0))),
                                          onPressed: () {
                                            // It returns true if the form is valid, otherwise returns false
                                            if (formKey.currentState
                                                .validate()) {
                                              //if date is validated
                                              if (bookingDateChecker(context,
                                                  _dateController.text)) {
                                                int user_id =
                                                    this.widget.user.id;

                                                event_id =
                                                    randomId(11000, 900000);
                                                var event = Events(
                                                    id: event_id,
                                                    user_id: user_id,
                                                    daytime: eventListTime[
                                                        time.index],
                                                    title: title,
                                                    feedback_status: "Ongoing",
                                                    event_date:
                                                        _dateController.text,
                                                    attendees: attendees,
                                                    type: this.widget.type);

                                                EventDatabase.instance
                                                    .insertEvent(event);

                                                Future<List<Events>> res =
                                                    EventDatabase.instance
                                                        .getEvents();
                                                print(res);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            (PaymentScreen(
                                                              user: this
                                                                  .widget
                                                                  .user,
                                                              event: event,
                                                              decor: eventDecorTime[
                                                                  decorOption
                                                                      .index],
                                                              price: this
                                                                  .widget
                                                                  .price,
                                                            ))));
                                              }
                                            }
                                          },
                                        ))
                                  ],
                                )),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

bool bookingDateChecker(BuildContext context, String date) {
  var converted = date.split("/"); //month , day , year
//   // DateTime format   year, month , day

  var curreentDate = DateTime.now();
//case 1 if year is off
  if ((curreentDate.year.toInt() - int.parse(converted[2])) > 0) {
    showAlertDialog(context, "Try Selecting Current Year");
    return false;
  }
//if month is off
  if ((curreentDate.year.toInt() - int.parse(converted[2]) == 0) &&
      (curreentDate.month.toInt() - int.parse(converted[0])) > 0) {
    showAlertDialog(context, "Try Selecting Current Month or upcoming months");
    return false;
  }
//if day is off
  if ((curreentDate.year.toInt() - int.parse(converted[2]) == 0) &&
      (curreentDate.month.toInt() - int.parse(converted[0]) == 0) &&
      (curreentDate.day.toInt() - int.parse(converted[1])) > 0) {
    showAlertDialog(context, "Try Selecting some upcoming day");
    return false;
  }

//if month is greater
  if ((curreentDate.month.toInt() - int.parse(converted[0])).abs() > 0) {
    return true;
  }
  //if day is within 4 days
  if ((curreentDate.day.toInt() - int.parse(converted[1])).abs() <= 3) {
    showAlertDialog(context, "Too Early try selecting some feasible date");
    return false;
  }

  return true;
}
