import '../constants/index.dart';
import '../utils/NetworkRequestUtil.dart';

Future<dynamic> sendMessageCodeApi(params) => networkRequestUtil
    .get(HTTP_API.SEND_MESSAGE_CODE, params: params); // 发送验证码接口

Future<dynamic> loginApi(data) =>
    networkRequestUtil.post(HTTP_API.LOGIN, data: data); // 登录接口

Future<dynamic> getUserInformationApi() =>
    networkRequestUtil.get(HTTP_API.GET_USER_INFORMATION); // 获取用户信息接口

Future updateUserInformationApi(data) => networkRequestUtil
    .put(HTTP_API.GET_USER_INFORMATION, data: data); // 更新用户信息接口

Future<dynamic> uploadAvatarApi(data) =>
    networkRequestUtil.upload(HTTP_API.UPLOAD_RESOURCE, data); // 上传头像接口
