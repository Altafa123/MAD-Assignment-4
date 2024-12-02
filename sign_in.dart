import 'package:flutter/material.dart';
import '../pages/authentication.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn(BuildContext context) async {
    final feedback = await AuthenticationService.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (feedback == 'success') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(feedback)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Enter Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleSignIn(context),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
