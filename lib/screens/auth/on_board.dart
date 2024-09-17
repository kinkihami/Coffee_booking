import 'package:coffee_store/constants/constants.dart';
import 'package:coffee_store/screens/auth/login.dart';
import 'package:flutter/material.dart';

class ScreenOnBoard extends StatelessWidget {
  const ScreenOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Image.asset(
            'assets/images/start.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height/1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 3.2),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  const Text(
                    'Time for a coffee break....',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sora',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  const Text(
                    'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Colors.white70),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const ScreenLogin())),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width / 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: buttonColor),
                      child: const Center(
                        child: Text('Get Started',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Sora',
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
