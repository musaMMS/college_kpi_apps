
import 'package:college_kpi_apps/login_singup_screen/singup_screen.dart';
import 'package:college_kpi_apps/widget/BottomNavBar_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text('LogIn'),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset('kurigram.jpeg'),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan
                      ),
                      onPressed: () {
                        // Login logic here
                        Navigator.
                        push(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
                      },
                      child: Text('Login',
                        style: TextStyle(
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Google login logic
                            },
                            icon: Icon(Icons.login),
                            color: Colors.red,
                            iconSize: 40.0,
                          ),
                          IconButton(
                            onPressed: () {
                              // Facebook login logic
                            },
                            icon: Icon(Icons.facebook),
                            color: Colors.blue,
                            iconSize: 40.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                        child: Text('Don\'t have an account? Sign Up'),
                      ),
                    ),
                  ],
                ),
            ),
          ),
      ),
    );
  }
}