import 'package:flutter/material.dart';

import '../../../components/NotifyItem.dart';

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key, required this.announceList}) : super(key: key);
  final List announceList;
  @override _HomePageListState createState()=> _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  // 头部组件
  Widget getTitleWidget() {
    return Padding(padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset('assets/images/notice@2x.png', width: 25, height: 25,),
          const SizedBox(width: 5,), // 图标与文字之间的间距
          const Text('社区', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          const Text('公告', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange))
        ],
      )
    );
  }

  // 获取渲染内容
  Widget getListContainer() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.announceList.map((item) {
        return NotifyItem(item: item);
      }).toList(),
    );
  }

  @override Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [getTitleWidget(), getListContainer()],
      ),
    );
  }
}