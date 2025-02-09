import 'package:college_kpi_apps/login_singup_screen/login_screen.dart';
import 'package:college_kpi_apps/user_auth/firebaseauth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String email = "", name = "", password = "";
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  registration(String email, String password) async {
    if (password.isNotEmpty && namecontroller.text.isNotEmpty && emailcontroller.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registered Successfully", style: TextStyle(fontSize: 18.0))),
        );
        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      } on FirebaseAuthException catch (e) {
        String errorMsg = "An error occurred";
        if (e.code == 'weak-password') {
          errorMsg = 'Password provided is too weak';
        } else if (e.code == "email-already-in-use") {
          errorMsg = "Account already exists";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(errorMsg, style: const TextStyle(fontSize: 16.0)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05), // Dynamic Spacing
              const Text(
                'Sign In to your account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/kurigram.jpeg',
                    width: screenWidth * 0.3, // Responsive image
                    height: screenWidth * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(namecontroller, 'Username'),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField(emailcontroller, 'Email or Phone'),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField(passwordcontroller, 'Password', isPassword: true),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: Colors.blueAccent)),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildContinueButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.04),
              _buildOrDivider(),
              SizedBox(height: screenHeight * 0.02),
              _buildSocialLoginButtons(),
              SizedBox(height: screenHeight * 0.03),
              _buildPrivacyText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  Widget _buildContinueButton(double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            email = emailcontroller.text;
            password = passwordcontroller.text;
          });
          registration(email, password);
        }
      },
      child: Container(
        width: screenWidth * 0.8,
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('or', style: TextStyle(color: Colors.grey)),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook, color: Colors.blueAccent),
          onPressed: () {
            AuthMethods().signInWithGoogle(context);
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.login),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPrivacyText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "By continuing, you acknowledge that you have read and agree to our Terms & Conditions and Privacy Policy.",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
