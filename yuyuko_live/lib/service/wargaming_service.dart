import 'package:logging/logging.dart';
import 'package:yuyuko_live/model/player_result.dart';
import 'package:yuyuko_live/service/base_service.dart';

import 'key/key.dart' as key;

class WargamingService extends BaseService {
  final _logger = Logger('WargamingService');
  static const _key = key.WARGAMING;
  final _appId = '?application_id=$_key';

  @override
  //TODO: The region is HARD CODED
  String get baseUrl => 'https://api.worldofwarships.asia/wows';

  ApiResult<List<PlayerResult>> getPlayerId(String playerName) async {
    final result = await getObject(
      '$baseUrl/account/list/$_appId&search=$playerName',
    );

    return decodeList(result, PlayerResult.fromJson);
  }

  Future getShipStats(String accountId) async {
    final result = await getObject(
      '$baseUrl/ships/stats/$_appId&account_id=$accountId',
    );
    print(result);
  }
}
