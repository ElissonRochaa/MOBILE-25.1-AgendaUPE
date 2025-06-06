import 'package:flutter/material.dart';
import 'package:calendarioupe/components/my_textfield.dart';
import 'package:calendarioupe/components/my_button.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [


Center(
  child: Wrap(
   children: [
    for(int z=0;z<13;z++)
 Container(
    margin: const EdgeInsets.all(20.0),
    width: 20.0,
    height: 60.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.black,
  ),
  ),
   ],
  )
),


              const SizedBox(height: 125),

              MyTextField(
                controller: usernameController,
                hintText: 'Usuario',
                obscureText: false,
              ),


              const SizedBox(height: 25),

              MyTextField(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),

              const SizedBox(height: 50),


              MyButton(
                onTap: signUserIn,
              ),


       ],
     ),
    );
  }
}