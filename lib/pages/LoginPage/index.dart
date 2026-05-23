import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/CustomToastUtil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => LoginPageViewState();
}

class LoginPageViewState extends State<LoginPage> {
  int count = 60; // 获取短信验证码冷却倒计时
  Timer? timer;

  // 开始请求倒计时
  void beginCountDown() {
    // 在新的一轮倒计时开始前先判断是否上一轮已经结束
    if (count == 60) {
      // 开始倒计时
      timer = Timer.periodic(const Duration(seconds: 1), (timer){
         if (count == 0) {
          timer.cancel(); // 倒计时结束 取消定时器
          count = 60; // 重置倒计时时间
          setState(() {});
          return; // 结束执行
         }
         count--;
         setState(() {});
      });
    } else {
      // 倒计时没结束 没有道理再开一个定时器
      PromptAction.showWarning("请等到60s结束再发送");
    }
  }

  // 销毁事件中的定时器
  @override void dispose() {
    timer?.cancel(); // 取消定时器
    super.dispose();
  }

  // 获取验证码组件
  Widget getTimeShow() {
    if (count == 60) {
      return const Text('获取验证码');
    }
    return Text('${count}s', style: TextStyle(color: Colors.grey));
  }
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 垂直方向布局
          children: [
            const Row(children: [Text('登录', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))]),
            const SizedBox(height: 10), // 垂直方向间距
            const Row(children: [Text('加入宅萌居, 让生活更轻松', style: TextStyle(fontSize: 15))],),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, // 垂直方向居中对齐
              children: [
                const Expanded(child: TextField(decoration: InputDecoration(labelText: '手机号', hintText: '请输入手机号'))),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(255, 85, 145, 175),
                    minimumSize: const Size(100, 50)
                  ),
                  child: getTimeShow(),
                  onPressed: () {
                    beginCountDown();
                  }
                )
              ],
            ),
            const SizedBox(height: 8),
            const TextField(decoration: InputDecoration(labelText: '验证码', hintText: '请输入6位验证码')),
            const SizedBox(height: 8),
            const Row(
              children: [Text('未注册手机号经验证后将自动登录', style: TextStyle(fontSize: 12, color: Colors.grey))]
            ),
            const SizedBox(height: 50),
            // 登录按钮
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 85, 145, 175),
                      minimumSize: const Size(100, 50),
                    ),
                    child: const Text('登录', style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {}
                  )
                )
              ],
            )
          ],
        )
      ),
    );
  }
}