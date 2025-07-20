import 'package:flutter/material.dart';
import 'mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void validateAndLogin() {
    String email = emailController.text.trim();
    String pass = passController.text;

    if (!email.contains('@')) {
      showSnack("Invalid email address");
    } else if (pass.length < 6) {
      showSnack("Password must be at least 6 characters");
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Account sign-in successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: validateAndLogin,
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
