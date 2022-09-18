import 'package:logging/logging.dart';
import 'package:yuyuko_live/model/game_server.dart';
import 'package:yuyuko_live/model/player_result.dart';
import 'package:yuyuko_live/model/player_stats.dart';
import 'package:yuyuko_live/service/base_service.dart';

import 'key/key.dart' as key;

class WargamingService extends BaseService {
  final _logger = Logger('WargamingService');
  static const _key = key.WARGAMING;
  final _appId = '?application_id=$_key';
  late final _domain;

  WargamingService({required GameServer server}) {
    this._domain = server.domain;
  }

  @override
  String get baseUrl => 'https://api.worldofwarships.$_domain/wows';

  ApiResult<List<PlayerResult>> getPlayerId(String playerName) async {
    final result = await getObject(
      '$baseUrl/account/list/$_appId&search=$playerName',
    );

    return decodeList(result, PlayerResult.fromJson);
  }

  ApiResult<List<SingleShipStatistic>?> getShipStats(String accountId,
      {String shipId = ''}) async {
    String url = '$baseUrl/ships/stats/$_appId&account_id=$accountId';
    if (shipId.isNotEmpty) {
      url += '&ship_id=$shipId';
    }

    final result = await getObject(
      url,
    );

    final reponse = result.data as Map<String, dynamic>?;
    final playerData = reponse?['data'] as Map<String, dynamic>?;
    // Deal with player with hidden stats
    try {
      final shipData = playerData?.values.first as List?;
      final List<SingleShipStatistic>? shipStats = shipData?.map((e) {
        return SingleShipStatistic.fromJson(e as Map<String, dynamic>);
      }).toList();
      print(shipStats);
      return ServiceResult(data: shipStats);
    } catch (e) {
      return ServiceResult(
        data: null,
        errorMessage: 'Player has hidden stats',
      );
    }
  }
}
