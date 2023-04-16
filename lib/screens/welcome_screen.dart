import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//import 'package:flash_chat/screens/';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      //upperBound: 100,
    );

    animation = ColorTween(begin: Colors.yellowAccent, end: Colors.white)
        .animate(controller);
    controller.forward();

    // for to & fo motion of any animation;
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      //backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image(
                      image: AssetImage('images/flash.png'),
                    ),
                    //  height: animation.value * 100,
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Quick Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundbuttonPadding(
              colour: Colors.blueAccent,
              title: 'Log In',
              onPresseds: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundbuttonPadding(
              colour: Colors.blueAccent,
              title: 'Registration',
              onPresseds: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundbuttonPadding extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RoundbuttonPadding({this.colour, this.title, required this.onPresseds});

  final Color? colour;
  final String? title;
  final VoidCallback onPresseds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPresseds,
          //Go to login screen.
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title!,
          ),
        ),
      ),
    );
  }
}
