import 'package:shared_preferences/shared_preferences.dart';
import '../constants/index.dart';

class TokenManager {
  String token = "";

  Future<SharedPreferences> getInstance() {
    return SharedPreferences.getInstance();
  }

  // 初始化token
  init() async {
    final preferences = await getInstance(); // 获取实例
    token = preferences.getString(Constants.TOKEN_KEY) ?? "";
  }

  // 存储token
  Future<void> setToken(String token) async {
    final preferences = await getInstance(); // 获取实例
    preferences.setString(Constants.TOKEN_KEY, token);
  }

  // 获取token
  String getToken() {
    return token;
  }

  // 清除token
  Future<void> clearToken() async {
    final preferences = await getInstance(); // 获取实例
    preferences.remove(Constants.TOKEN_KEY);
  }
}

final tokenManager = TokenManager();