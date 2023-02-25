import 'package:flutter/material.dart';
import 'package:inditok/view/widgets/glith.dart';
import 'package:inditok/view/widgets/text_input.dart';


class LoginScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(child: const Text("INDITOK",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: emailController, myIcon: Icons.email, myLabelText: "Email")
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: passwordController, myIcon: Icons.password, myLabelText: "Password")
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text("LOGIN",style: TextStyle(fontSize: 14),),
            )),
          ],
        ),
      ),
    );
  }
}
