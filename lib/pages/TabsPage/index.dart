import 'package:abode_cute_house/pages/HomePage/index.dart';
import 'package:abode_cute_house/pages/MinePage/index.dart';
import 'package:abode_cute_house/utils/EmitterUtil.dart';
import 'package:flutter/material.dart';

import '../../utils/CustomToastUtil.dart';
import '../../utils/TokenManager.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);
  @override TabsPageState createState()=> TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  int currentIndex = 0; // 当前选中的TabBar索引
  final List _tabBarList = [
    {
      'icon': 'assets/tabs/home_default.png',
      'label': '首页',
      'activeIcon': 'assets/tabs/home_active.png',
    },
    {
      'icon': 'assets/tabs/my_default.png',
      'label': '我的',
      'activeIcon': 'assets/tabs/my_active.png',
    }
  ];

  @override void initState() {
    super.initState();
    tokenManager.init();
    registerEvent();
  }

  // 注册事件
  registerEvent() {
    PTEmitter.on<LogoutEvent>().listen((event) {
      PromptAction.showSuccess("退出成功");
      Navigator.pushNamed(context, "/loginPage"); // 跳转到登录页
    });
  }

  // 实现底Tab布局的方法
  List <BottomNavigationBarItem> buildTabBar() {
    List <BottomNavigationBarItem> tabBarList = [];
    for(var a=0; a<_tabBarList.length; a++) {
      tabBarList.add(
        BottomNavigationBarItem(
          label: _tabBarList[a]["label"],
          icon: Image.asset(_tabBarList[a]["icon"], width: 30, height: 30),
          activeIcon: Image.asset(_tabBarList[a]["activeIcon"], width: 30, height: 30),
        )
      );
    }
    return tabBarList;
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(
        index: currentIndex,
        children: [
          const HomePageView(),
          MineView(
            activeIndex: currentIndex,
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, 
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: buildTabBar(),
        ),
    );
  }
}