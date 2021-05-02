import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrimony_app/utils/colors.dart';
import 'package:matrimony_app/utils/fonts.dart';
import 'package:matrimony_app/utils/images.dart';
import 'package:matrimony_app/views/home/Matches.dart';
import 'package:matrimony_app/views/home/chat.dart';
import 'package:matrimony_app/views/home/explore.dart';
import 'package:matrimony_app/views/home/notification.dart';
class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {


  var pages = [
    ExploreScreen(),
    ChatScreen(),
    // GroupPage(),
    MatchesScreen(),
    NotificationScreen(),
  ];

  /// The initial tab bar screen
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 16,
        backgroundColor: Colors.white,
        selectedLabelStyle: AppFonts.primaryFont(
          fontSize: 14,
          // color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        unselectedLabelStyle: AppFonts.primaryFont(
          fontSize: 14,
          // color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.exploreIcon),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.exploreIcon,),
            title: Text('Matches'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.exploreIcon),
            title: Text('chat'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.exploreIcon),
            title: Text('Notification'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  /// Change screen on tap tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
