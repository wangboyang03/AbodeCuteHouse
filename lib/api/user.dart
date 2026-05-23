import '../constants/index.dart';
import '../utils/NetworkRequestUtil.dart';

Future<dynamic> sendMessageCodeApi(params)=> networkRequestUtil.get(HTTP_API.SEND_MESSAGE_CODE, params: params); // 发送验证码接口