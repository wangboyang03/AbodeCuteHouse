import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => LoginPageViewState();
}

class LoginPageViewState extends State<LoginPage> {
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
                  child: const Text('获取验证码'),
                  onPressed: () {}
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