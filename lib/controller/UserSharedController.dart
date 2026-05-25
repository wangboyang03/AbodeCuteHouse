import 'package:get/get.dart';

class UserSharedcontroller extends GetxController {
  Map<String, dynamic> userInformation = {"avatar": "", "nickName": "", "id": ''}; // 声明共享用户信息集合
  void updateUserInformation(Map<String, dynamic> info) {
    userInformation = info;
    update(); // 更新共享用户信息 使其响应式更新
  }
}
