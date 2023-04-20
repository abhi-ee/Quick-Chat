import 'package:quick_chat/screens/chat_screen.dart';
import 'package:quick_chat/screens/registration_screen.dart';
import 'package:quick_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:quick_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreen extends StatefulWidget {
  static const String id='login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  bool spiner=false;
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spiner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 250.0,
                  child: Image.asset('images/flash.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration:kbuttonDecoration.copyWith(hintText: "Enter Your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration: kbuttonDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
    RoundbuttonPadding(
    colour: Colors.blueAccent,
    title: 'Log In',
    onPresseds: () async{

      setState(() {
        spiner=true;
      });

            try {
                      final user = _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null)
                        Navigator.pushNamed(context, ChatScreen.id);

                      setState(() {
                        spiner=false;
                      });
                    }
             catch(e){
              print(e);
             }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
