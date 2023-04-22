import 'package:codeslicejobs/common/constants/color_constants.dart';
import 'package:codeslicejobs/presentation/screen/application_screen.dart';
import 'package:codeslicejobs/presentation/screen/bookmark_screen.dart';
import 'package:codeslicejobs/presentation/screen/detail_screen.dart';
import 'package:codeslicejobs/presentation/screen/home_screen.dart';
import 'package:codeslicejobs/presentation/screen/message_screen.dart';
import 'package:codeslicejobs/presentation/screen/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Bookmark',
      style: optionStyle,
    ),
  ];
  List screens =[
    HomeScreen(),
    BookMarkScreen(),
    ApplicationScreen(),
    MessageScreen(),
    BookMarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MetaColors.primaryColor
    ));


    return Scaffold(
      body: Center(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   boxShadow: [
        //     BoxShadow(
        //       blurRadius: 20,
        //       color: Colors.black.withOpacity(.1),
        //     )
        //   ],
        // ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: MetaColors.primaryColor,
              hoverColor: MetaColors.primaryColor,
              gap: 8,
              activeColor: MetaColors.whiteColor,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: MetaColors.primaryColor,
              color: MetaColors.primaryColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,

                ),
                GButton(
                  icon: LineIcons.bookmark,

                ),

                GButton(
                  icon: LineIcons.airbnb,

                ),
                GButton(
                  icon: LineIcons.facebookMessenger,

                ),

                GButton(
                  icon: LineIcons.user,

                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}