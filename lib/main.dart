// ignore_for_file: must_be_immutable

import 'package:coffee_store/constants/constants.dart';
import 'package:coffee_store/constants/shared_preference.dart';
import 'package:coffee_store/function/cart_function.dart';
import 'package:coffee_store/screens/auth/on_board.dart';
import 'package:coffee_store/screens/bottomNavigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  bool? logged = await Sharedstore.getLoggedin();
  runApp(MyApp(logged: logged,));
}

class MyApp extends StatelessWidget {
  bool? logged;
  MyApp({super.key, required this.logged});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool logged1 = logged ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        
        useMaterial3: true,
      ),
      home: logged1? ScreenBottomNavigationBar() : ScreenOnBoard(),
    );
  }
}

