import 'package:flutter/material.dart';
import 'package:inditok/view/widgets/glith.dart';
import 'package:inditok/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _setPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(
                  child: const Text(
                "WELCOME TO INDITOK",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://media.istockphoto.com/id/1016744004/vector/profile-placeholder-image-gray-silhouette-no-photo.jpg?s=612x612&w=0&k=20&c=mB6A9idhtEtsFXphs1WVwW_iPBt37S2kJp6VpPhFeoA="),
                    radius: 50,
                  ),
                  Positioned(
                    child: CircleAvatar(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                      radius: 15,
                      backgroundColor: Colors.white,
                    ),
                    right: 0,
                    bottom: 0,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                      controller: _emailController,
                      myIcon: Icons.email,
                      myLabelText: "Email")),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                      controller: _setPasswordController,
                      myIcon: Icons.password,
                      myLabelText: "Set Password")),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                      controller: _confirmPasswordController,
                      myIcon: Icons.email,
                      myLabelText: "Confirm Password")),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                      controller: _userController,
                      myIcon: Icons.person,
                      myLabelText: "UserName")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 14),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
