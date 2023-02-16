
import 'package:flutter/material.dart';
import '../accountPage/account_page.dart';
import '../book/bookPage.dart';
import '../constants/color.dart';
import '../topicScreen/topicNew.dart';
import 'featuerd_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    topicB(),
    bookPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: Colors.blue[900],
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_filled,
                color: Colors.black,

              ),
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,

              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.list_outlined,
                color: Colors.black,

              ),
              icon: Icon(
                Icons.list_outlined,
                color: Colors.white,

              ),
              label: "My Class",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.book,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.book,
                color: Colors.white,
              ),
              label: "Books",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,

              ),
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: "My Account",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}