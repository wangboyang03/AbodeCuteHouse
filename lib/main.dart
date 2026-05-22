import 'package:abode_cute_house/pages/TabsPage/index.dart';
import 'package:flutter/material.dart';

import 'pages/NotificationDetailsPage/index.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => const TabsPage(),
      "/notificationDetailsPage": (context) => const NotificationDetailsPage(),
    },
  ));
}