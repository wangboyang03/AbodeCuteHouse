import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);
  @override _TabsPageState createState()=> _TabsPageState();
  
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('主页'),
    );
  }
}