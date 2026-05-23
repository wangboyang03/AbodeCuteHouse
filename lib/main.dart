import 'package:flutter/material.dart';

import 'routes/index.dart';
import 'utils/TokenManager.dart';

void main() {
  tokenManager.init(); // 实例化首选项并获取token
  runApp(getRouterWidget()); // 从路由表中获取路由并启动app
}