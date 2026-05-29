import 'package:flutter/material.dart';

import 'navigationColumn.dart';

class HomePageNavigation extends StatefulWidget {
  const HomePageNavigation({Key? key}) : super(key: key);
  @override _HomePageNavigationState createState()=> _HomePageNavigationState();
  }

  class _HomePageNavigationState extends State<HomePageNavigation> {
    final List _navigationList = [
      {
        'icon': 'assets/images/house_nav_icon@2x.png',
        "name": "house",
        'title': '我的房子'
      },
      {
        'icon': 'assets/images/repair_nav_icon@2x.png',
        "name": "repair",
        'title': '我的报修'
      },
      {
        'icon': 'assets/images/visitor_nav_icon@2x.png',
        "name": "visitor",
        'title': '访客登记'
      }
    ];
    
    List<Widget> getNavigationListWidget() {
      return _navigationList.map((item) {
        return NavigationColumn(
          icon: item['icon'],
          title: item['title'],
          onClick: () {
            if (item["name"] == "house") {
              Navigator.pushNamed(context, "/houselist");
            }
          },
        );
      }).toList();
    }

    @override Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          children: getNavigationListWidget(),
        ),
      );
    }
  }