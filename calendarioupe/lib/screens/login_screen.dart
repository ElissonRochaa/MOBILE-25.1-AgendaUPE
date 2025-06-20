import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:calendarioupe/components/my_textfield.dart';
import 'package:calendarioupe/components/my_button.dart';
import 'package:calendarioupe/components/my_decoration.dart';




class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

void passwordReset() async {
  
  try {
   await FirebaseAuth.instance.sendPasswordResetEmail(
    email :usernameController.text);
      showDialog(context: context, builder: (context) {
      return AlertDialog(title:Center (child: Text ('Um email foi eviado com sucesso!')));
    } );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);

}
}


  // sign user in method
  void signUserIn() async {



     try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameController.text, 
      password: passwordController.text);
     } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);

     }

  }



   void showErrorMessage(String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title:Center (child: Text (message)));
    } ); }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
       
       
         Hero(tag: 'deco', child: MyDecoration()),
       
       
       
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
                  text: 'Logar',
                  onTap: signUserIn,
                ),

                 const SizedBox(height: 25),
                 
                MyButton(
                  text: 'Recuperar senha',
                  onTap: passwordReset,
                ),

                 const SizedBox(height: 25),
       



                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )




       
       
       
       
       
         ],
       ),
     ),
    );
  }
} 