import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        children: [
          Image(image: Image.asset('assets/images/start.png').image),
          Text("WELCOME TO",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              Text("The Shopping App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              )),
          SizedBox(height: 50),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
                },
                child: Text("Login"),
              ),
                SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
               
                  ),
                
                ),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ));
                },
                child: Text("Sgin Up"),
              ),
        ],
      ),
    ),
  )
    
    );
  
  }
  
}