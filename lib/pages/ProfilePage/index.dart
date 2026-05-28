import 'dart:io';

import 'package:abode_cute_house/api/user.dart';
import 'package:abode_cute_house/controller/UserSharedController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// 当导入的两个及以上三方插件库且均有相同名字的接口方法时 需要把另一个不需要的接口hide(隐藏)掉 避免编译器识别错误
import 'package:get/get.dart'
    hide FormData, MultipartFile; // 隐藏Get包中的FormData和MultipartFile
import 'package:dio/dio.dart'; // 使用Dio包中的FormData和MultipartFile
import 'package:image_picker/image_picker.dart';

import '../../utils/CustomToastUtil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  UserSharedcontroller controller = Get.find();
  TextEditingController nickController = TextEditingController();
  String tempAvatar = ""; // 临时存储头像
  String tempFileName = ""; // 临时存储头像的文件名

  @override
  void initState() {
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
    var avatar = controller.userInformation["avatar"] ?? "";
    // 判断是否需要上传头像
    if (!tempAvatar.isEmpty) {
      FormData? data;
      // 用户选择了头像需要上传
      if (kIsWeb) {
        Uint8List list = await XFile(tempAvatar).readAsBytes(); // 读取二进制
        MultipartFile file =
            MultipartFile.fromBytes(list, filename: tempFileName); // 得到的文件对象
        data = FormData.fromMap({"file": file, "type": "avatar"});
      } else {
        // 移动端平台
        data = FormData.fromMap(
            {"file": MultipartFile.fromFileSync(tempAvatar), "type": 'avatar'});
      }

      final result = await uploadAvatarApi(data);
      avatar = result["url"]; // 上传成功后返回的url
    }
    await updateUserInformationApi(
        {"nickName": nickController.text, "avatar": avatar});
    // 清理临时变量
    tempAvatar = "";
    tempFileName = "";
    PromptAction.showSuccess("用户资料保存成功");
    controller.userInformation["nickName"] = nickController.text; // 更新对象里面的属性
    controller.userInformation["avatar"] = avatar; // 更新对象里面的属性
    controller
        .updateUserInformation(controller.userInformation); // 更新用户共享状态 响应式更新
  }

  showSelectDialog() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                getAvatarFromCamera(), // 现场拍照
                getAvatarFromPhotos(), // 从图库选
                getCancel(), // 关闭
              ],
            ),
          );
        });
  }

  Widget getUserAvatar() {
    if (!tempAvatar.isEmpty) {
      if (kIsWeb) {
        return Image.network(tempAvatar, width: 30, height: 30);
      }
      return Image.file(File(tempAvatar), width: 30, height: 30);
    }
    if (controller.userInformation["avatar"] != "" &&
        controller.userInformation["avatar"] != null) {
      return Image.network(controller.userInformation["avatar"],
          width: 30, height: 30);
    }
    return Image.asset('assets/images/avatar_1.jpg', width: 30, height: 30);
  }

  openLibrary() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      // PromptAction.showSuccess("选择照片成功");
      tempAvatar = file.path; // 文件路径
      tempFileName = file.name; // 文件名称
      setState(() {});
      Navigator.pop(context);
    }
  }

  // 点击头像弹出选择头像模态层
  Widget getAvatarFromCamera() {
    return SizedBox(
        height: 50,
        child: GestureDetector(
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 10),
                      Text("拍照")
                    ])),
            onTap: () {}));
  }

  Widget getAvatarFromPhotos() {
    return SizedBox(
      height: 50,
      child: GestureDetector(
          child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_library),
                    SizedBox(width: 10),
                    Text("相册")
                  ])),
          onTap: () {
            openLibrary();
          }),
    );
  }

  Widget getCancel() {
    return GestureDetector(
        child: const SizedBox(
            height: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.cancel),
              SizedBox(width: 10),
              Text("取消")
            ])),
        onTap: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('个人中心'),
            backgroundColor: Colors.transparent,
            centerTitle: true),
        backgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.all(10), children: [
          GestureDetector(
            onTap: () {
              showSelectDialog();
            },
            child: SizedBox(
                height: 40,
                child: Row(children: [
                  const Text('头像', style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // child: Image.asset('assets/images/avatar.png', width: 30, height: 30)
                      child: getUserAvatar(),
                    ),
                    const Icon(Icons.arrow_back_ios, size: 12)
                  ])
                ])),
          ),
          Row(children: [
            const Text('昵称'),
            const Spacer(),
            Expanded(
              child: TextField(
                controller: nickController,
                decoration: const InputDecoration(
                    hintText: '请输入昵称', border: InputBorder.none),
                textAlign: TextAlign.right,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12)
          ]),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 85, 145, 175),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                saveUserInformation();
              },
              child: const Text('保存',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ))
          ])
        ]));
  }
}
