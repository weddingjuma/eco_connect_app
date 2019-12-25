import 'package:eco_connect_app/components/dashboard.dart';
import 'package:eco_connect_app/components/history.dart';
import 'package:eco_connect_app/components/notice.dart';
import 'package:eco_connect_app/components/profile.dart';
import 'package:eco_connect_app/components/waste.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  int currentTab = 0;
  Dashboard dashboard;
  Profile profile;
  History history;
  Notice notice;
  Waste waste;
  List trans = List();

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    dashboard = Dashboard();
    profile = Profile();
    history = History();
    notice = Notice();
    waste = Waste();
    pages = [dashboard, profile, history, notice];

    currentPage = dashboard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: currentTab,
        inactiveColor: Colors.black,
        indicatorColor: Colors.green,
        reverse: true,
        activeColor: Theme.of(context).primaryColor,
        
         onTap: (index){
          setState(() {
            currentPage = pages[index];
            currentTab = index;
          });
        },
        // circleColor: Theme.of(context).primaryColor,
        // inactiveIconColor: Theme.of(context).primaryColor,
        // initialSelection: 0,
        items: [
          TitledNavigationBarItem(icon: Icons.home, title: "Home",),
          TitledNavigationBarItem(icon: Icons.account_circle, title: "Profile"),
          TitledNavigationBarItem(icon: Icons.local_shipping, title: "Pickup History"),
          TitledNavigationBarItem(icon: Icons.notification_important, title: "Notification"),
          
        ],
      ),
    );
  }
}
