// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:classtime_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: _emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}
