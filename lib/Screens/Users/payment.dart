import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import '../../Screens/Users/home.dart';
import '../../components/randomNo.dart';
import '../../database/event_database.dart';
import '../../models/user.dart';
import '../../models/event.dart';
import '../../models/payment.dart';
import '../../components/alertD.dart';
import '../../components/buttonAlert.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen(
      {Key? key,
      required this.user,
      required this.event,
      required this.decor,
      required this.price})
      : super(key: key);
  final User user;
  final Events event;
  final String decor;
  final int price;

  @override
  _MyAppState createState() => _MyAppState();
}

int decorPrice = 10000;

class _MyAppState extends State<PaymentScreen> {
  int? total_price;
  String? cardNumber;
  String? name;
  String? validate;
  String? cvv;
  int? id;

  // translate and customize captions
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xfffcdf8a),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final cardDecoration = BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
      ],
      gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  @override
  void initState() {
    super.initState();

    //calculate price
    total_price =
        calculatePrice(this.widget.event, this.widget.decor, this.widget.price);
    print(total_price);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        'Event Title',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        this.widget.event.title,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Text(
                        'Attendees',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Text(
                        this.widget.event.attendees,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Text(
                        'Timings',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF6F35A5),
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 5, 0, 0),
                      child: Text(
                        this.widget.event.daytime,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Text(
                        'Event Date',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                      child: Text(
                        this.widget.event.event_date,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 20),
                      child: Text(
                        'Total Price',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 20),
                      child: Text(
                        'Rs/-' + total_price.toString(),
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: Stack(children: [
                    CreditCardInputForm(
                      showResetButton: true,
                      onStateChange: (currentState, cardInfo) {
                        print(cardInfo.toString());
                        var converted = cardInfo.toString().split(",");
                        print(converted);
                        cardNumber = converted[0].trim();
                        name = converted[1].trim();
                        validate = converted[2].trim();
                        cvv = converted[3].trim();
                      },
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: new ElevatedButton(
                      child: const Text(
                        'Proceed',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF6F35A5),
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0))),
                      onPressed: () async {
                        int pay_id = randomId(11000, 900000);
                        int user_id = this.widget.user.id;
                        int event_id = this.widget.event.id;

                        var payment = Payment(
                          id: pay_id,
                          user_id: user_id,
                          event_id: event_id,
                          card_no: cardNumber!,
                          cvv: cvv!,
                          holder_name: name!,
                          expiry_date: validate!,
                          amount: total_price!,
                        );

                        EventDatabase.instance.insertPayment(payment);
                        //Send Mail
                        await sendEmail("mariaazrar2000@gmail.com");
                        
                        showBookAlertDialog(
                            context,
                            this.widget.user,
                            "Payment Done",
                            "Congratulations Your Event Has Been Booked");
                      },
                    )),
              ],
            )),
          ),
        ));
  }
}

int calculatePrice(Events event, String decor, int price) {
  int total_price = 1;
  total_price = int.parse(event.attendees) * price;
  if (decor == "Yes") {
    total_price = total_price + decorPrice;
  }
  return total_price;
}

sendEmail(String emailAddress) async {
  final Email email = Email(
    body: 'ThankYou For Booking Your Event With Us.',
    subject: 'EventZilla Booking',
    recipients: [emailAddress],
    //cc: ['cc@example.com'],
    //bcc: ['bcc@example.com'],
    //attachmentPaths: ['/path/to/attachment.zip'],
    isHTML: false,
  );
}

// try {
//                       cardNumber = converted[0].substring(
//                         11,
//                       );
//                       name = converted[1].substring(
//                         6,
//                       );
//                       validate = converted[2].substring(
//                         10,
//                       );
//                       cvv = converted[3].substring(
//                         5,
//                       );
//                       }catch(e) {
//                         print("exception occured");
//                         print(e);
//                       }
