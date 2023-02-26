import 'package:flutter/material.dart';
import 'package:inditok/%20controller/auth_controller.dart';
import 'package:inditok/view/widgets/glitch.dart';
import 'package:inditok/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(child: const Text("INDITOK",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),)),
            const SizedBox(height: 30,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _emailController, myIcon: Icons.email, myLabelText: "Email"),
            ),
            const SizedBox(height: 20,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _passwordController, myIcon: Icons.password, myLabelText: "Password",toHide: true,),
            ),
            const SizedBox(height: 30,),
           ElevatedButton(onPressed: (){
             AuthController.instance.logIn(_emailController.text, _passwordController.text);
           }, child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
               child: const Text("LOGIN",style: TextStyle(fontSize: 15),),),),
          ],
        ),
      ),
    );
  }
}
