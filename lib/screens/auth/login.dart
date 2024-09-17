import 'package:coffee_store/constants/constants.dart';
import 'package:coffee_store/constants/shared_preference.dart';
import 'package:coffee_store/screens/bottomNavigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
              child: Image.asset(
                'assets/images/start.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sora',
                            color: Colors.white),
                      ),
                      const Text(
                        "We've already met!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            color: Colors.white70),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 10,
                      ),
                      TextFormField(
                        controller: usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: const TextStyle(color: Colors.white38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white38),
                          ),
                        ),
                        validator: (value)=>
                          value!.isEmpty?'Please enter your username':null
                        ,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obsecureText,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecureText = !obsecureText;
                                });
                              },
                              icon: obsecureText
                                  ? const Icon(Icons.visibility,color: Colors.white38,)
                                  : const Icon(Icons.visibility_off,color: Colors.white38,)),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white38),
                          ),
                        ),
                        validator: (value)=>
                          value!.isEmpty?'Please enter your password':null
                        ,
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            Sharedstore.setUsername(usernameController.text);
                            Sharedstore.setLoggedin(true);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> const ScreenBottomNavigationBar()),(route) => false,);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width / 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: buttonColor),
                          child: const Center(
                            child: Text('Submit',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
