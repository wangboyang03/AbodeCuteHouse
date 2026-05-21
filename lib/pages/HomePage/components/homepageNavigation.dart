import 'package:flutter/material.dart';

class HomePageNavigation extends StatefulWidget {
  const HomePageNavigation({Key? key}) : super(key: key);
  @override _HomePageNavigationState createState()=> _HomePageNavigationState();
  }

  class _HomePageNavigationState extends State<HomePageNavigation> {
    @override Widget build(BuildContext context) {
      return Container(
        child: const Text('导航组件'),
      );
    }
  }