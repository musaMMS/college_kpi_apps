import 'package:college_kpi_apps/login_singup_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: ClipOval(
                    child: Image.asset('assets/kurigram.jpeg'),
                  ),
                ),
                   Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ) ,
                        child: const Text('Kurigram Polytechnic Institute',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:20,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 100,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                        child: const Text('Get Strated',
                        style: TextStyle(
                          fontSize: 25,
                        ),

                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}