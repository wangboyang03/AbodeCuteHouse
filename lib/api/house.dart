import 'package:abode_cute_house/constants/index.dart';
import 'package:abode_cute_house/utils/NetworkRequestUtil.dart';

Future<dynamic> getHouseListApi() => networkRequestUtil.get(HTTP_API.HOUSE_LIST);