import 'package:calendarioupe/screens/calendar_screeen.dart';
import 'package:calendarioupe/screens/login_screen.dart';
import 'package:calendarioupe/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(title: 'Calendario', home: MyApp()));
}

void signUserOut() {
    FirebaseAuth.instance.signOut();

}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
       appBar: AppBar(
       centerTitle: true,
       toolbarHeight: 50,
       backgroundColor: Colors.grey,
       title: Image.asset('assets/images/logo.png', width: 100, height: 100,),
        leading: IconButton(onPressed: signUserOut, icon: Icon(Icons.exit_to_app)),
        actions: [ IconButton(onPressed: () => {}, icon: Icon(Icons.dark_mode)),],
      ),
       body: AuthScreen(),
       backgroundColor: Colors.white,
       
    
    )

    );
  }


  
}
