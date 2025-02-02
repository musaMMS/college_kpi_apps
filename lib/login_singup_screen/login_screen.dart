import 'package:college_kpi_apps/login_singup_screen/singup_screen.dart';
import 'package:college_kpi_apps/widget/BottomNavBar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", name = "", password = "";
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  userLogin(String email, String password) async {
    if (password.isNotEmpty && emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Logged in successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong password provided",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No account found for this email",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                       'Log In your account',
                       style: TextStyle(
                         color:Colors.black,
                         fontSize: 20,
                       ),
                     ),
                   ],
                 ),
              SizedBox(width: 30),
              ClipOval(
                child: Image.asset('assets/kurigram.jpeg'),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Use TextFormField instead of TextField
                    TextFormField(
                      controller: emailcontroller,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email or Phone',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Use TextFormField instead of TextField
                    TextFormField(
                      obscureText: true,
                      controller: passwordcontroller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()){
                    // Navigate if form is valid
                    setState(() {
                      email=emailcontroller.text;
                      password=passwordcontroller.text;
                    });userLogin(email,password);
                  }
                },
                child:Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('Continue'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.login_rounded))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have a acoount?",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          email = emailcontroller.text;
                          password = passwordcontroller.text;
                        });
                        userLogin(email,password);
                      }
                    },
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SinginScreen()));
                        },
                        child: Text(
                          'SingUp',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "By continuing, you acknowledge that you have read and agree to our Terms & Conditions and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
