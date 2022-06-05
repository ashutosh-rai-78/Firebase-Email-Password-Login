import 'package:firebase_email_password_login/login_page.dart';
import 'package:firebase_email_password_login/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context) => Login(),
      'register' : (context) => Register()
    },
  ));
}
