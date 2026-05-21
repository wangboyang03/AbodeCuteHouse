import 'package:flutter/material.dart';

import '../../../components/NotifyItem.dart';

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);
  @override _HomePageListState createState()=> _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  final List _listContent = [
    {
      'title': '你有一条新消息',
      'content': '这次我站在雾里连自己都看不清了，我不怪你我只怪大雾四起，也不怪大雾四起只怪你的爱意太浅，连大雾都要遮掩',
      'createAt': '2023-08-01 10:00:00'
    },
    {
      'title': '你有一条新消息',
      'content': '后来职高的风也没有吹过普高，那年的爱留在盛夏，遗憾也被东风吹走，我好想你',
      'createAt': '2023-08-02 10:00:00'
    },
    {
      'title': '你有一条新消息',
      'content': '穷就不要谈恋爱了，谈着谈着，你又娶不了她',
      'createAt': '2023-08-03 10:00:00'
    }
  ];

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
      children: _listContent.map((item) {
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