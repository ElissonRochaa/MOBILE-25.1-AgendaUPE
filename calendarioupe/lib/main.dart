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
       backgroundColor: Colors.grey,
       title: const Text('Calendario UPE')
      ),
       body: CalendarScreeen(),
       backgroundColor: Colors.white,
       
    
    )


     



    );
  }
}
