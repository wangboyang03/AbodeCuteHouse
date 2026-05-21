import '../constants/index.dart';
import '../utils/NetworkRequestUtil.dart';

Future<dynamic> getAnnounceListApi() => networkRequestUtil.get(HTTP_API.ANNOUNCE_LIST); // 获取公告列表