import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import '../models/event.dart';
import '../models/feedback.dart';
import '../models/payment.dart';
import '../models/services.dart';
import '../models/user.dart';

class EventDatabase {
  //instance that is calling our private constructor
  static final EventDatabase instance = EventDatabase._init();

  //pribate constructor can have any name
  EventDatabase._init();

  //field for our database
  // only have a single app-wide reference to the database
  static Database? _database;

  //now we need to open our database
  Future<Database> get database async {
    //if database alredy creted
    if (_database != null) return _database!;

    // if not created instantiate the db the first time it is accessed
    _database = await _iniDB('event_database.db');
    return _database!;
  }

  _iniDB(String filename) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, filename);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // Run the CREATE TABLE statement on the database.

      await db.execute(
        'CREATE TABLE Events(id INTEGER PRIMARY KEY, user_id INTEGER, daytime TEXT, title TEXT ,feedback_status TEXT, event_date TEXT , attendees TEXT, type TEXT)',
      );
      await db.execute(
        'CREATE TABLE Feedback(id INTEGER PRIMARY KEY, user_id INTEGER, event_id INTEGER, date INTEGER )',
      );
      await db.execute(
        'CREATE TABLE Payment(id INTEGER PRIMARY KEY, user_id INTEGER, event_id INTEGER, card_no TEXT,holder_name TEXT, cvv TEXT,amount INTEGER , expiry_date TEXT)',
      );
      // await db.execute(
      //   'CREATE TABLE Services(service_id INTEGER PRIMARY KEY, service_name TEXT, service_price INTEGER)' service_id INTEGER,
      // );
      await db.execute(
        'CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT,email TEXT, contact TEXT, address TEXT, status TEXT, username TEXT, password TEXT, type TEXT)',
      );
    });
  }

  void delete() async {
    // Get a location using getDatabasesPath
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'event_database.db');

    // Delete the database
    await deleteDatabase(path);
    print("deleted");
  }

  //###################################### USER ##########################################33
  Future<int> insertUser(User user) async {
    // Get a reference to the database.
    print(user);
    try {
      final db = await database;

      await db.insert(
        'User',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Added");
      return 1;
    } catch (exception) {
      return 0;
    }
  }

  // A method that retrieves all the users from the
  Future<List<User>> getUsers() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The user.
    final List<Map<String, dynamic>> maps = await db.query('User');

    // Convert the List<Map<String, dynamic> into a List<Users>.
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          contact: maps[i]['contact'],
          address: maps[i]['address'],
          status: maps[i]['status'],
          username: maps[i]['username'],
          password: maps[i]['password'],
          type: maps[i]['type']);
    });
  }

  Future<User?> validateUser(String name, String password) async {
    final db = await database;
    var response = await db.rawQuery(
        "SELECT * FROM User WHERE username = '$name' and password = '$password'");
    if (response.length > 0) {
      return new User.fromMap(response.first);
    }

    return null;
  }

  Future<List<User>> getAllUsers() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The user.
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM User where username != 'admin'");

    // Convert the List<Map<String, dynamic> into a List<Users>.
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          contact: maps[i]['contact'],
          address: maps[i]['address'],
          status: maps[i]['status'],
          username: maps[i]['username'],
          password: maps[i]['password'],
          type: maps[i]['type']);
    });
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'User',
      where: "id = ?",
      whereArgs: [id],
    );
    print("User deleted successfully");
  }

  //###################################### EVENT ##########################################33
  Future<int> insertEvent(Events event) async {
    // Get a reference to the database.
    print(event);
    try {
      final db = await database;

      await db.insert(
        'Events',
        event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Event Added");
      return 1;
    } catch (exception) {
      return 0;
    }
  }

  // A method that retrieves all the Events from the
  Future<List<Events>> getEvents() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Events.
    final List<Map<String, dynamic>> maps = await db.query('Events');

    // Convert the List<Map<String, dynamic> into a List<Events>.
    return List.generate(maps.length, (i) {
      return Events(
        id: maps[i]['id'],
        user_id: maps[i]['user_id'],
        daytime: maps[i]['daytime'],
        title: maps[i]['title'],
        feedback_status: maps[i]['feedback_status'],
        event_date: maps[i]['event_date'],
        type: maps[i]['type'],
        attendees: maps[i]['attendees'],
      );
    });
  }

  // A method that retrieves all the accounts from the
  Future<List<Events>> getUsersEvents(int _id) async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Events where user_id = '${_id}'");

    // Convert the List<Map<String, dynamic> into a List<Events>.
    return List.generate(maps.length, (i) {
      return Events(
        id: maps[i]['id'],
        user_id: maps[i]['user_id'],
        daytime: maps[i]['daytime'],
        title: maps[i]['title'],
        feedback_status: maps[i]['feedback_status'],
        event_date: maps[i]['event_date'],
        attendees: maps[i]['attendees'],
        type: maps[i]['type'],
      );
    });
  }

  //delete event
  Future<void> deleteEvent(int id) async {
    final db = await database;
    await db.delete(
      'Events',
      where: "id = ?",
      whereArgs: [id],
    );
    print("Event deleted successfully");
  }

  //update Status
  void updateStatus(int _id, String status) async {
    // Get a reference to the database.
    final db = await database;

    int updateCount = await db.rawUpdate('''
    UPDATE Events 
    SET feedback_status = ?
    WHERE id = ?
    ''', [status, _id]);
    print("updated and count is");
    print(updateCount);
  }

  //###################################### FEEDBACK ##########################################33
  Future<int> insertFeedback(FeedbackC feedback) async {
    // Get a reference to the database.
    print(feedback);
    try {
      final db = await database;

      await db.insert(
        'Feedback',
        feedback.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Feedback Added");
      return 1;
    } catch (exception) {
      return 0;
    }
  }

  // A method that retrieves all the Feedback from the
  Future<List<FeedbackC>> getFeedback() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Feedback.
    final List<Map<String, dynamic>> maps = await db.query('Feedback');

    // Convert the List<Map<String, dynamic> into a List<Feedback>.
    return List.generate(maps.length, (i) {
      return FeedbackC(
        id: maps[i]['id'],
        user_id: maps[i]['user_id'],
        event_id: maps[i]['event_id'],
        date: maps[i]['date'],
        
      );
    });
  }

  //###################################### PAYMENT ##########################################33
  Future<int> insertPayment(Payment payment) async {
    // Get a reference to the database.
    print(payment);
    try {
      final db = await database;

      await db.insert(
        'Payment',
        payment.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return 1;
    } catch (exception) {
      return 0;
    }
  }

  // A method that retrieves all the Payment from the
  Future<List<Payment>> getPayment() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Payment.
    final List<Map<String, dynamic>> maps = await db.query('Payment');
    // Convert the List<Map<String, dynamic> into a List<Payment>.
    return List.generate(maps.length, (i) {
      return Payment(
        id: maps[i]['id'],
        user_id: maps[i]['user_id'],
        event_id: maps[i]['event_id'],
        card_no: maps[i]['card_no'],
        holder_name: maps[i]['holder_name'],
        cvv: maps[i]['cvv'],
        amount: maps[i]['amount'],
        expiry_date: maps[i]['expiry_date'],
      );
    });
  }

//delete payment
  Future<void> deletePayment(int id) async {
    final db = await database;
    await db.delete(
      'Payment',
      where: "event_id = ?",
      whereArgs: [id],
    );
    print("Payment deleted successfully");
  }

  //###################################### SERVICE ##########################################33
  //   Future<int> insertService(Services service) async {
  //   // Get a reference to the database.
  //   print(service);
  //   try {
  //     final db = await database;

  //     await db.insert(
  //       'Services',
  //       service.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace,
  //     );
  //     return 1;
  //   } catch (exception) {
  //     return 0;
  //   }
  // }

  // // A method that retrieves all the Services from the
  // Future<List<Services>> getService() async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Query the table for all The Services.
  //   final List<Map<String, dynamic>> maps = await db.query('Services');

  //   // Convert the List<Map<String, dynamic> into a List<Services>.

  //   return List.generate(maps.length, (i) {
  //     return Services(
  //         service_id: maps[i]['service_id'],
  //         service_name: maps[i]['service_name'],
  //         service_price: maps[i]['service_price'],
  //         );

  //   });
  // }
  // A method that retrieves all the Feedback from the
}
