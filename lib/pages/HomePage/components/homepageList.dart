import 'package:flutter/material.dart';

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);
  @override _HomePageListState createState()=> _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override Widget build(BuildContext context) {
    return Container(
      child: const Text('列表组件'),
    );
  }
}