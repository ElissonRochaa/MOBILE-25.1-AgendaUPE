import 'package:calendarioupe/screens/calendar_screeen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
        leading: IconButton(onPressed: () => {}, icon: Icon(Icons.exit_to_app)),
        actions: [ IconButton(onPressed: () => {}, icon: Icon(Icons.dark_mode)),],
       
      ),
       body: CalendarScreeen(),
       backgroundColor: Colors.white,
       
    
    )

    );
  }


  
}
