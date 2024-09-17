import 'package:coffee_store/constants/shared_preference.dart';
import 'package:coffee_store/screens/bottomNavigation/cart.dart';
import 'package:coffee_store/screens/bottomNavigation/favourite.dart';
import 'package:coffee_store/screens/bottomNavigation/home.dart';
import 'package:coffee_store/screens/bottomNavigation/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBottomNavigationBar extends StatefulWidget {
  const ScreenBottomNavigationBar({super.key});

  @override
  State<ScreenBottomNavigationBar> createState() =>
      _ScreenBottomNavigationBarState();
}

class _ScreenBottomNavigationBarState extends State<ScreenBottomNavigationBar> {
  int pageNo = 0;
  String? name;

  Future<void> getname() async {
    name = await Sharedstore.getUsername();
    setState(() {});
  }

  @override
  void initState() {
    getname();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ScreenHome(name: name ?? ''), // Handle null safety
      Screencart(),
      ScreenFavourite(),
      ScreenNotification()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageNo,
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() {
                pageNo = value;
              }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: items[0],
              activeIcon: items[1],
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: items[2],
              activeIcon: items[3],
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: items[4],
              activeIcon: items[5],
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: items[6],
              activeIcon: items[7],
              label: 'Notification',
            ),
          ]),
      body: _pages.elementAt(pageNo),
    );
  }

  var items = [
    SvgPicture.asset('assets/icons/home.svg'),
    SvgPicture.asset('assets/icons/home_select.svg'),
    SvgPicture.asset('assets/icons/bag.svg'),
    SvgPicture.asset('assets/icons/bag_select.svg'),
    SvgPicture.asset('assets/icons/favourite.svg'),
    SvgPicture.asset('assets/icons/favourite_select.svg'),
    SvgPicture.asset('assets/icons/bell.svg'),
    SvgPicture.asset('assets/icons/bell_select.svg'),
  ];
}
