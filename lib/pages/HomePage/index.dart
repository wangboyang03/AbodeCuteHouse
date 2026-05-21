import 'package:flutter/material.dart';
import '../../api/homepage.dart';
import 'components/homepageList.dart';
import 'components/homepageNavigation.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override HomePageViewState createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  // 初始化
  @override void initState() {
    super.initState();
    getAnnounceListContent();
  }

  // 获取公告列表内容
  getAnnounceListContent() async {
    final result = await getAnnounceListApi();
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Text(result.toString()),
      );
    });
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("宅萌居"),
        centerTitle: true, // 标题居中
      ),
      body: ListView(
        scrollDirection: Axis.vertical, // 垂直方向布局
        children: [
          const HomePageNavigation(), // 导航栏
          Image.asset('assets/images/banner@2x.jpg'), // 横幅
          const HomePageList(), // 列表
        ],
        // 设置列表纵向滚动
      ),
    );
  }
}