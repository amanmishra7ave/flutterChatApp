import 'package:flutter/material.dart';
import 'package:flutterchat2/constants.dart';
import 'package:flutterchat2/screens/reUseCode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterchat2/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        // inAsyncCall: showSpinner,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kDecorationText.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kDecorationText.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              ReuseCode(
                label: 'Register',
                colour: Colors.blueAccent,
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:flutter_chat_app/constants.dart';
// import 'package:flutter_chat_app/screens/reUseCode.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_chat_app/screens/chat_screen.dart';

// class RegistrationScreen extends StatefulWidget {
//   static String id = 'registractio_screen';

//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;
//   String? email;
//   String? password;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase app
//     WidgetsFlutterBinding.ensureInitialized();
//     Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Hero(
//               tag: 'logo',
//               child: Container(
//                 height: 200.0,
//                 child: Image.asset('images/logo.png'),
//               ),
//             ),
//             SizedBox(
//               height: 48.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               textAlign: TextAlign.center,
//               onChanged: (value) {
//                 email = value;
//               },
//               decoration:
//                   kDecorationText.copyWith(hintText: 'Enter your Email'),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               obscureText: true,
//               textAlign: TextAlign.center,
//               onChanged: (value) {
//                 password = value;
//               },
//               decoration:
//                   kDecorationText.copyWith(hintText: 'Ente your Registration'),
//             ),
//             SizedBox(
//               height: 24.0,
//             ),
//             ReuseCode(
//               label: 'Register',
//               colour: Colors.blueAccent,
//               onPress: (() async {
//                 try {
//                   final newUser = await _auth.createUserWithEmailAndPassword(
//                       email: email.toString(), password: password.toString());
//                   if (newUser != null) {
//                     Navigator.pushNamed(context, ChatScreen.id);
//                   }
//                 } catch (e) {
//                   print('There is an error');
//                 }
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
