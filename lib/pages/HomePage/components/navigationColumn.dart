import 'package:flutter/material.dart';

class NavigationColumn extends StatefulWidget {
  const NavigationColumn({Key? key, required this.icon, required this.title}) : super(key: key);
  final String icon;
  final String title;
  
  @override _NavigationColumnState createState() => _NavigationColumnState();
}

class _NavigationColumnState extends State<NavigationColumn> {
  @override Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Image.asset(
          widget.icon,
          width: 35,
          height: 35,
        ),
        const SizedBox(
          height: 5,
        ), // 图标与文字间距
        Text(widget.title)
      ],)
    );
  }
}