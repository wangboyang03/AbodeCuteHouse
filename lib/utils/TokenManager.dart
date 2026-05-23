import 'package:shared_preferences/shared_preferences.dart';
import '../constants/index.dart';

class TokenManager {
  Future<SharedPreferences> getInstance() {
    return SharedPreferences.getInstance();
  }

  // 存储token
  Future<void> setToken(String token) async {
    final preferences = await getInstance(); // 获取实例
    preferences.setString(Constants.TOKEN_KEY, token);
  }

  // 获取token
  Future<String> getToken() async {
    final preferences = await getInstance(); // 获取实例
    return preferences.getString(Constants.TOKEN_KEY) ?? "";
  }

  // 清除token
  Future<void> clearToken() async {
    final preferences = await getInstance(); // 获取实例
    preferences.remove(Constants.TOKEN_KEY);
  }
}

final tokenManager = TokenManager();