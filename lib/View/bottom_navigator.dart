import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Calendar/calendar.dart';
import 'package:bit_planner/View/Home/home_screen.dart';
import 'package:bit_planner/View/Meetings/meetings.dart';
import 'package:bit_planner/View/Messages/messages.dart';
import 'package:bit_planner/View/Profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:unicons/unicons.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  late double height;
  late double width;
  PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), Meetings(), Calendar(), Messages(), Profile()];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return PersistentTabView(
      context,
      controller: _persistentTabController,
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(UniconsLine.home_alt),
          title: ("Home"),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                //color: grey,
                height: 1,
                fontSize: height * 0.014,
                fontWeight: FontWeight.w400),
          ),
          activeColorPrimary: primaryBlue,
          inactiveColorPrimary: grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(UniconsLine.meeting_board),
          title: ("Meetings"),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                //color: grey,
                height: 1,
                fontSize: height * 0.014,
                fontWeight: FontWeight.w400),
          ),
          activeColorPrimary: primaryBlue,
          inactiveColorPrimary: grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(UniconsLine.calender),
          title: ("Calendar"),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                //color: grey,
                height: 1,
                fontSize: height * 0.014,
                fontWeight: FontWeight.w400),
          ),
          activeColorPrimary: primaryBlue,
          inactiveColorPrimary: grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(UniconsLine.comment_lines),
          title: ("Messages"),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                //color: grey,
                height: 1,
                fontSize: height * 0.014,
                fontWeight: FontWeight.w400),
          ),
          activeColorPrimary: primaryBlue,
          inactiveColorPrimary: grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(UniconsLine.user),
          title: ("Profile"),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                //color: grey,
                height: 1,
                fontSize: height * 0.014,
                fontWeight: FontWeight.w400),
          ),
          activeColorPrimary: primaryBlue,
          inactiveColorPrimary: grey,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }
}