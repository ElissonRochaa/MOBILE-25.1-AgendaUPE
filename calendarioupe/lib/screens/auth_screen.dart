import 'package:calendarioupe/screens/calendar_screeen.dart';
import 'package:calendarioupe/screens/loginOrSign_screen.dart';
import 'package:calendarioupe/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthScreen extends StatelessWidget{
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        // logado
        if (snapshot.hasData){
          return CalendarScreeen();
        }

        // nao logado
        else {
          return LoginorsignScreen();
        }
      }
    )


   );

  }
}