import 'package:shared_preferences/shared_preferences.dart';
import '../constants/index.dart';

class TokenManager {
  String token = "";
  String refreshToken = "";

  Future<SharedPreferences> getInstance() {
    return SharedPreferences.getInstance();
  }

  // 初始化token
  init() async {
    final preferences = await getInstance(); // 获取实例
    token = preferences.getString(Constants.TOKEN_KEY) ?? "";
    refreshToken = preferences.getString(Constants.REFRESH_TOKEN_KEY) ?? "";
  }

  // 存储token
  Future<void> setToken(String token, {String? refreshToken}) async {
    final preferences = await getInstance(); // 获取实例
    preferences.setString(Constants.TOKEN_KEY, token);
    preferences.setString(Constants.REFRESH_TOKEN_KEY, refreshToken ?? "");
    this.token = token;
    this.refreshToken = refreshToken ?? "";
  }

  // 获取token
  String getToken() {
    return token;
  }

  String getRefreshToken() {
    return refreshToken;
  }

  // 清除token
  Future<void> clearToken() async {
    final preferences = await getInstance(); // 获取实例
    preferences.remove(Constants.TOKEN_KEY);
    token = "";
    preferences.remove(Constants.REFRESH_TOKEN_KEY);
    refreshToken = "";
  }
}

final tokenManager = TokenManager();