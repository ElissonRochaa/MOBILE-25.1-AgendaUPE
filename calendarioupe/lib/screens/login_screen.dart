import 'package:flutter/material.dart';
import 'package:calendarioupe/components/my_textfield.dart';
import 'package:calendarioupe/components/my_button.dart';
import 'package:calendarioupe/components/my_decoration.dart';



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


MyDecoration(),



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