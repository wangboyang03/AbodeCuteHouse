import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../api/homepage.dart';

class NotificationDetailsPage extends StatefulWidget {
  const NotificationDetailsPage({Key? key}) : super(key: key);
  @override NotificationDetailsPageViewState createState() => NotificationDetailsPageViewState();
}

class NotificationDetailsPageViewState extends State<NotificationDetailsPage> {
  Map<String, dynamic> announceDetailContent = {};
  @override void initState() {
    super.initState(); // implement initState
  }

  @override void didChangeDependencies() {
    super.didChangeDependencies(); // implement didChangeDependencies
    final params = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // PromptAction.showToast(params["id"]);
    if (params != null && params["id"] != "") {
      getAnnounceDetailContent(params["id"]);
    }
  }

  getAnnounceDetailContent(String id) async {
    announceDetailContent = await getAnnounceDetailApi(id);
    setState(() {});
  }

  Widget getContentWidget() {
    return ListView(
      scrollDirection: Axis.vertical, // 垂直方向滚动
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
            children: [
              // 内容标题
              Text(announceDetailContent["title"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 两端对齐
                children: [
                  // 发布者
                  Text(announceDetailContent["creatorName"] ?? "", style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  Text(announceDetailContent["createdAt"] ?? "", style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 20),
              // 内容 富文本组件填充
              Html(data: announceDetailContent["content"] ?? "")
            ]
          )
        )
      ],
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通知详情"),
      ),
      body: getContentWidget(),
    );
  }
}