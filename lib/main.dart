import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat2/screens/welcome_screen.dart';
import 'package:flutterchat2/screens/login_screen.dart';
import 'package:flutterchat2/screens/registration_screen.dart';
import 'package:flutterchat2/screens/chat_screen.dart';

void main() => runApp(FlashChat());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const FlashChat());
// }

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen()
      },
    );
  }
}
