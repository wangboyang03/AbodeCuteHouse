class Constants {
  static const String BASE_URL = 'https://live-api.itheima.net/'; // 网络请求基地址
  static const int NEW_WORK_TIME_OUT = 10; // 网络请求超时时间 单位秒
  static const int SUCCESS_CODE = 10000; // 成功业务码
  static const String TOKEN_KEY = 'abode_cute_house_token'; // 存储首选项的登录token
  static const String REFRESH_TOKEN_KEY =
      'abode_cute_house_refresh_token'; // 存储首选项的刷新token
}

class HTTP_API {
  static const String ANNOUNCE_LIST = 'announcement'; // 公告列表接口
  static const String SEND_MESSAGE_CODE = "/code"; // 发送验证码接口
  static const String LOGIN = "/login"; // 登录地址
  static const String GET_USER_INFORMATION = "/userInfo"; // 获取用户信息接口
  static const String UPLOAD_RESOURCE = '/upload'; // 上传资源接口
  static const String HOUSE_LIST = '/room'; // 房屋列表接口
}
