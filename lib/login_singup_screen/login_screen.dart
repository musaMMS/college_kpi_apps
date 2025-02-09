import 'package:college_kpi_apps/login_singup_screen/singup_screen.dart';
import 'package:college_kpi_apps/widget/BottomNavBar_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  userLogin(String email, String password) async {
    if (password.isNotEmpty && email.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Logged in successfully", style: TextStyle(fontSize: 18.0)),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));
      } on FirebaseAuthException catch (e) {
        String errorMsg = "An error occurred";
        if (e.code == 'wrong-password') {
          errorMsg = "Wrong password provided";
        } else if (e.code == "user-not-found") {
          errorMsg = "No account found for this email";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(errorMsg, style: TextStyle(fontSize: 16.0)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Dynamic padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log In to your account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ClipOval(
                child: Image.asset(
                  'assets/kurigram.jpeg',
                  height: screenWidth * 0.25, // Adjust image size
                  width: screenWidth * 0.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email or Phone',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Please enter your email or phone number' : null,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      obscureText: true,
                      controller: passwordcontroller,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.blueAccent)),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.06, // Adjust button height
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = emailcontroller.text;
                        password = passwordcontroller.text;
                      });
                      userLogin(email, password);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or', style: TextStyle(color: Colors.black)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blueAccent),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.login_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: Colors.black)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SigninScreen()));
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.blueAccent)),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "By continuing, you acknowledge that you have read and agree to our Terms & Conditions and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
