import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_password_login/home_page.dart';
import 'package:firebase_email_password_login/login_page.dart';
import 'package:firebase_email_password_login/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'login',
            routes: {
              'login': (context) => Login(),
              'register': (context) => Register(),
              'homepage': (context) => HomePage()
            },
          );
        });
  }
}
