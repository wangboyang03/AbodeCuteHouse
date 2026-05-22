import 'package:flutter/material.dart';

import '../../utils/CustomToastUtil.dart';

class NotificationDetailsPage extends StatefulWidget {
  const NotificationDetailsPage({Key? key}) : super(key: key);
  @override NotificationDetailsPageViewState createState() => NotificationDetailsPageViewState();
}

class NotificationDetailsPageViewState extends State<NotificationDetailsPage> {
  @override void initState() {
    super.initState(); // implement initState
  }

  @override void didChangeDependencies() {
    super.didChangeDependencies(); // implement didChangeDependencies
    final params = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    PromptAction.showToast(params["id"]);
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通知详情"),
      ),
    );
  }
}