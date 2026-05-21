import 'package:flutter/material.dart';

class MineView extends StatefulWidget {
  const MineView({Key? key}) : super(key: key);
  @override _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  @override Widget build(BuildContext context) {
    return Container(
      child: const Text('我的'),
    );
  }
}