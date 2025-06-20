import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:calendarioupe/components/my_textfield.dart';
import 'package:calendarioupe/components/my_button.dart';
import 'package:calendarioupe/components/my_decoration.dart';



class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();


  // sign user in method
  void signUserUp() async {



     try {
     if (passwordController.text == confirmPasswordController.text) {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: usernameController.text, 
       password: passwordController.text);
     } else {
      showErrorMessage("Senhas não iguais");
     }


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
       
       
                const SizedBox(height: 25),
       
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirmar Senha',
                  obscureText: true,
                ),
       
                const SizedBox(height: 50),
       
       
       
       
                MyButton(
                  text: "Cadastrar",
                  onTap: signUserUp,
                ),

                 const SizedBox(height: 25),


       


                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Logar',
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