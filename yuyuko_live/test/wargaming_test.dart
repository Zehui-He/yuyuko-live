import 'package:flutter_test/flutter_test.dart';
import 'package:yuyuko_live/model/game_server.dart';
import 'package:yuyuko_live/service/wargaming_service.dart';

void main() {
  test('Fetch player ID', () async {
    final server = GameServer.fromIndex(3);
    final service = WargamingService(server: server);
    final result = await service.getPlayerId('henryquan');
    expect(result.data, isNotNull);
    expect(result.errorMessage, isNull);
    expect(result.data!.length > 0, isTrue);
    print(result.data?.first.accountId);
  });

  test('Fetch player ID then fetch ALL ship stats', () async {
    final server = GameServer.fromIndex(3);
    final service = WargamingService(server: server);
    final playerInfo = await service.getPlayerId('henryquan');
    final playerShipStatistics =
        await service.getShipStats(playerInfo.data!.first.accountId.toString());
    expect(playerShipStatistics.data?.isNotEmpty, isTrue);
  });

  test('Fetch player ID then fetch ONE ship stats', () async {
    final server = GameServer.fromIndex(3);
    final service = WargamingService(server: server);
    final playerInfo = await service.getPlayerId('henryquan');
    final playerShipStatistics = await service.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '4180588496');
    expect(playerShipStatistics.data?.isNotEmpty, isTrue);
  });

  test('Fetch player ID then fetch ship stats on very first battle', () async {
    final server = GameServer.fromIndex(3);
    final service = WargamingService(server: server);
    final playerInfo = await service.getPlayerId('henryquan');
    //TODO: This shipID represents Alaska(B)
    final playerShipStatistics = await service.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '3666786288');
    expect(playerShipStatistics.data == null, isTrue);
  });

  test('Fetch player ID from NA server', () async {
    final server = GameServer.fromIndex(2);
    final service = WargamingService(server: server);
    final result = await service.getPlayerId('henryquan');
    expect(result.data, isNotNull);
    expect(result.errorMessage, isNull);
    expect(result.data!.length > 0, isTrue);
    print(result.data?.first.accountId);
  });

  test('Fetch player ID then fetch ship stats on hidden player', () async {
    final server = GameServer.fromIndex(2);
    final service = WargamingService(server: server);
    final playerInfo = await service.getPlayerId('henryquan');
    //TODO: This shipID represents Alaska(B)
    final playerShipStatistics = await service.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '3666786288');
    expect(playerShipStatistics.data == null, isTrue);
    expect(
        playerShipStatistics.errorMessage == 'Player has hidden stats', isTrue);
  });
}
