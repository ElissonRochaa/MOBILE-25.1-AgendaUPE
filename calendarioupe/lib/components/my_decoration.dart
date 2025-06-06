import 'package:flutter/material.dart';

class MyDecoration extends StatelessWidget {


const MyDecoration({super.key});



@override
  Widget build(BuildContext context) {
return Center(
  child: Row(
   children: [
   for(int z=0;z<6;z++)
     Expanded(
  child:Container(
    margin: const EdgeInsets.all(20.0),
    width: 10.0,
    height: 60.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.blueGrey,
  ),
  ),
    )
   ],
  )
   );
 }
}