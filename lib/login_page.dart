import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = "";
  var password = "";

  userLogin() async {
    try {
      email = emailController.text;
      password = passwordController.text;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      Fluttertoast.showToast(
          msg: "This is a Toast message",  // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER,    // location
          timeInSecForIosWeb: 1,
        // duration
      );
      Navigator.pushReplacementNamed(context, 'homepage');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfully Log In")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(left: 35, top: 120),
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 37, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            onPressed: () {
                              userLogin();

                            },
                            color: Colors.white,
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "register");
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueAccent),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
