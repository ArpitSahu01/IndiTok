import 'package:flutter/material.dart';
import 'package:inditok/view/widgets/glitch.dart';
import 'package:inditok/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {

  SignupScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(child: const Text("WELCOME TO INDITOK",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,),)),
              const SizedBox(height: 20,),
              Stack(
                children: const [
                  CircleAvatar(backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png",),radius: 50,),
                  Positioned(right: 0,bottom: 0,child: CircleAvatar(backgroundColor: Colors.white,radius: 15, child: Icon(Icons.edit,color: Colors.black,size: 20,)),)
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _emailController, myIcon: Icons.email, myLabelText: "Email"),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _passwordController, myIcon: Icons.password, myLabelText: "Set Password",toHide: true,),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _passwordController, myIcon: Icons.password, myLabelText: "Confirm Password",toHide: true,),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(controller: _passwordController, myIcon: Icons.person, myLabelText: "UserName",toHide: true,),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){}, child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: const Text("SIGNUP",style: TextStyle(fontSize: 15),),),),
            ],
          ),
        ),
      ),
    );
  }
}
