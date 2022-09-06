import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:yuyuko_live/model/ship_information.dart';
import 'package:yuyuko_live/service/base_service.dart';

@immutable
class YuyukoService extends BaseService {
  final _logger = Logger('YuyukoService');

  @override
  String get baseUrl => 'https://api.wows.shinoaki.com';

  ApiResult<List<ShipInformation>> getAllShipInfo() async {
    final result = await getObject(
      '$baseUrl/public/wows/encyclopedia/ship/avg',
    );
    return decodeList(result, ShipInformation.fromJson);
  }
}
