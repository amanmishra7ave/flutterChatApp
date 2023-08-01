import 'package:flutter/material.dart';
import 'package:flutterchat2/screens/login_screen.dart';
import 'package:flutterchat2/screens/reUseCode.dart';
import 'package:flutterchat2/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  @mustCallSuper
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Color.fromARGB(95, 9, 5, 5),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ReuseCode(
              colour: Colors.lightBlueAccent,
              label: 'Log In',
              onPress: (() {
                Navigator.pushNamed(context, LoginScreen.id);
              }),
            ),
            ReuseCode(
              colour: Colors.blueAccent,
              label: 'Register',
              onPress: (() {
                Navigator.pushNamed(context, RegistrationScreen.id);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
