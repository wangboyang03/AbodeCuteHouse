import 'package:abode_cute_house/api/user.dart';
import 'package:abode_cute_house/controller/UserSharedController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/CustomToastUtil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override State<ProfilePage> createState()=> ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  UserSharedcontroller controller = Get.find();
  TextEditingController nickController = TextEditingController();

  @override void initState() {
    super.initState();
    nickController.text = controller.userInformation["nickName"] ?? "";
  }
  // 保存用户信息
  saveUserInformation() async {
    if (nickController.text.isEmpty) {
      PromptAction.showToast("用户昵称不能为空");
      return;
    }
    if (!RegExp(r'^[\u4e00-\u9fa5]{2,10}').hasMatch(nickController.text)) {
      PromptAction.showToast("昵称必须是2-10个中文字符");
      return;
    }
    await updateUserInformationApi({"nickName": nickController.text});
    PromptAction.showSuccess("用户资料保存成功");
    controller.userInformation["nickName"] = nickController.text; // 更新对象里面的属性
    controller.updateUserInformation(controller.userInformation); // 更新用户共享状态 响应式更新
  }

  Widget getUserAvatar() {
    if (controller.userInformation["avatar"] != "" && controller.userInformation["avatar"] != null) {
      return Image.network(controller.userInformation["avatar"], width: 30, height: 30);
    }
    return Image.asset('assets/images/avatar_1.jpg', width: 30, height: 30);
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        backgroundColor: Colors.transparent,
        centerTitle: true
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const Text('头像', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // child: Image.asset('assets/images/avatar.png', width: 30, height: 30)
                      child: getUserAvatar(),
                    ),
                    const Icon(Icons.arrow_back_ios, size: 12)
                  ]
                )
              ]
            )
          ),
          Row(
            children: [
              const Text('昵称'),
              const Spacer(),
              Expanded(
                child: TextField(
                  controller: nickController,
                  decoration: const InputDecoration(hintText: '请输入昵称', border: InputBorder.none),
                  textAlign: TextAlign.right,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 12)
            ]
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 85, 145, 175),
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {  
                    saveUserInformation();
                  },
                  child: const Text('保存', style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              )
            ]
          )
        ]
      )
    );
  }
}