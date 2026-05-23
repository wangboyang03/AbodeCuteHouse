import 'package:flutter/material.dart';

import '../pages/LoginPage/index.dart';
import '../pages/NotificationDetailsPage/index.dart';
import '../pages/ProfilePage/index.dart';
import '../pages/TabsPage/index.dart';
import '../utils/TokenManager.dart';

Widget getRouterWidget() {
  return MaterialApp(
    // 配置路由表
    routes: {
      "/": (context) => const TabsPage(), // 入口
      "/notificationDetailsPage": (context) => const NotificationDetailsPage(), // 通知详情页
      "/loginPage": (context) => const LoginPage(), // 登录页
      // "/profilePage": (context) => const ProfilePage() // 个人信息页
    },
    initialRoute: '/', // 指定初始路由为入口
    onGenerateRoute: (setting) {
      // 动态路由池
      // flutter 要求不能在UI绘制时执行异步操作 但读取token涉及I/O操作
      String token = tokenManager.getToken(); // 获取token
      if (token.isEmpty) {
        // 如果读不到token 直接去登录页
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      }
      if (setting.name == "/profilePage") {
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      }
      return null;
    }
  );
}