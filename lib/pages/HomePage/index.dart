import 'dart:async';

import 'package:flutter/material.dart';
import '../../api/homepage.dart';
import '../../utils/CustomToastUtil.dart';
import '../../utils/TokenManager.dart';
import 'components/homepageList.dart';
import 'components/homepageNavigation.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override HomePageViewState createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  int down = 60;
  Timer? timer;
  List announceList = [];
  // 初始化
  @override void initState() {
    super.initState();
    getAnnounceListContent();
  }

  // 获取公告列表内容
  getAnnounceListContent() async {
    final result = await getAnnounceListApi();
    // showDialog(context: context, builder: (context) {
    //   return AlertDialog(
    //     content: Text(result.toString()),
    //   );
    // });
    // print(result); // 打印到调试台
    announceList = result;
    setState(() {});
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
            ElevatedButton(
              onPressed: () {
                // 开始倒计时 定时器的执行频率为1秒
                timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                  down--;
                  setState(() {});
                  });
                },
                child: Text("开始")
              ),
              Text("${down}s"),
              ElevatedButton(
                onPressed: () {timer?.cancel();},
                child: Text("停止")
              ),
          Image.asset('assets/images/banner@2x.jpg'), // 横幅
          HomePageList(announceList: announceList,), // 列表
        ],
        // 设置列表纵向滚动
      ),
    );
  }
}