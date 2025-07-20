import 'package:flutter/material.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  void validateAndSubmit() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String pass = passController.text;
    String confirm = confirmController.text;

    if (name.isEmpty || name[0] != name[0].toUpperCase()) {
      showSnack("Name must start with a capital letter");
    } else if (!email.contains('@')) {
      showSnack("Invalid email format");
    } else if (pass.length < 6) {
      showSnack("Password must be at least 6 characters");
    } else if (pass != confirm) {
      showSnack("Passwords do not match");
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Account created successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/rigester.png', width: 200, height: 200),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
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
                TextField(
                  controller: confirmController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                  ),
                  onPressed: validateAndSubmit,
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
