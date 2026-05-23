import 'package:flutter/material.dart';

class MineView extends StatefulWidget {
  const MineView({Key? key}) : super(key: key);
  @override _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  // 1.顶部区域
  Widget buildTopWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color(0xFF78B1C5),
      child: Row(
        children: [
          // 头像
          ClipRRect(borderRadius: BorderRadius.circular(25),child: Image.asset('assets/images/avatar_1.jpg', width: 50, height: 50, fit: BoxFit.cover)),
          const SizedBox(width: 15),
          // 用户名
          const Text('用户名', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Spacer(),
          // 完善信息按钮
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profilePage');
            },
            child: const Row(
              children: [
                Text('完善信息', style: TextStyle(color: Colors.white, fontSize: 14)),
                Icon(Icons.chevron_right, color: Colors.white, size: 20)
              ],
            ),
          )
        ]
      )
    );
  }

  // 2.功能列表
  Widget CellGroupItemWidget() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          CellItemWidget(
            title: '我的房屋',
            icon: 'assets/images/house_profile_icon@2x.png',
            onTap: (){}
          ),
          const Divider(height: 1),
          CellItemWidget(
            title: '我的报修',
            icon: 'assets/images/repair_profile_icon@2x.png',
            onTap: (){}
          ),
          const Divider(height: 1),
          CellItemWidget(
            title: '访客记录',
            icon: 'assets/images/visitor_profile_icon@2x.png',
            onTap: (){}
          ),
        ],
      ),
    );
  }

  // 3.每个功能项
  Widget CellItemWidget({required String icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(children: [
          Image.asset(icon, width: 24, height: 24,),
          const SizedBox(width: 15),
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20)
        ])
      )
    );
  }

  // 标题区域
  Widget buildTitleWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      color: const Color(0xFF78B1C5),
      child: const Text('我的', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF78B1C5),
      body: SafeArea(
        top: false, // 让背景色侵入顶部安全区域
        child: Column(
          children: [
            // 添加一个标题区域，替代AppBar
            Container(width: double.infinity, padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, bottom: 10),
              color: const Color(0xFF78B1C5),
              child: const Center(
                child: Text("我的", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            buildTopWidget(),
            CellGroupItemWidget(),
          ],
        ),
      ),
    );
  }
}