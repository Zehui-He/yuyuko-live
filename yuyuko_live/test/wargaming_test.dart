import 'package:flutter_test/flutter_test.dart';
import 'package:yuyuko_live/model/game_server.dart';
import 'package:yuyuko_live/service/wargaming_service.dart';

void main() {
  /// Tests are commence on Asian server unless specified
  final AsianServer = GameServer(WoWsServer.asia);
  final AsianService = WargamingService(server: AsianServer);

  test('Fetch player ID', () async {
    final result = await AsianService.getPlayerId('henryquan');
    expect(result.data, isNotNull);
    expect(result.errorMessage, isNull);
    expect(result.data!.length > 0, isTrue);
    expect(result.data?.first.accountId == 2011774448, isTrue);
    print(result.data?.first.accountId);
  });

  test('Fetch player ID then fetch ALL ship stats', () async {
    final playerInfo = await AsianService.getPlayerId('henryquan');
    final playerShipStatistics = await AsianService.getShipStats(
        playerInfo.data!.first.accountId.toString());
    expect(playerShipStatistics.data?.isNotEmpty, isTrue);
  });

  test('Fetch player ID then fetch ONE ship stats', () async {
    final playerInfo = await AsianService.getPlayerId('henryquan');
    //TODO: This shipID represents Neptune
    final playerShipStatistics = await AsianService.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '4180588496');
    expect(playerShipStatistics.data?.isNotEmpty, isTrue);
  });

  test('Fetch player ID then fetch ship stats on very first battle', () async {
    final playerInfo = await AsianService.getPlayerId('henryquan');
    //TODO: This shipID represents Alaska(B)
    final playerShipStatistics = await AsianService.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '3666786288');
    expect(playerShipStatistics.data == null, isTrue);
    expect(playerShipStatistics.errorMessage == 'First battle on this ship',
        isTrue);
  });

  /// The following tests are for NA server
  final NAServer = GameServer(WoWsServer.northAmerica);
  final NAService = WargamingService(server: NAServer);
  test('Fetch player ID from NA server', () async {
    final result = await NAService.getPlayerId('henryquan');
    expect(result.data, isNotNull);
    expect(result.errorMessage, isNull);
    expect(result.data!.length > 0, isTrue);
    expect(result.data?.first.accountId == 1025459900, isTrue);
    print(result.data?.first.accountId);
  });

  test('Fetch player ID then fetch ship stats on hidden player', () async {
    final playerInfo = await NAService.getPlayerId('henryquan');
    //TODO: This shipID represents Alaska(B)
    final playerShipStatistics = await NAService.getShipStats(
        playerInfo.data!.first.accountId.toString(),
        shipId: '3666786288');
    expect(playerShipStatistics.data == null, isTrue);
    expect(
        playerShipStatistics.errorMessage == 'Player has hidden stats', isTrue);
  });
}
