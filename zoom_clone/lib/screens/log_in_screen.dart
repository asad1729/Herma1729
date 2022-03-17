import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/custom_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Start or join a meeting",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Image.asset("assets/images/zoom.jpeg"),
            ),
            customButton(text: "Login", onPressed: () async {
              bool res =  await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home-screen');
              }
            }),
          ],
        ),
      ),
    );
  }
}
