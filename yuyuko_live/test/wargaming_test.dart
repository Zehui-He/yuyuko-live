import 'package:flutter_test/flutter_test.dart';
import 'package:yuyuko_live/service/wargaming_service.dart';

void main() {
  test('Fetch player ID', () async {
    final service = WargamingService();
    final result = await service.getPlayerId('henryquan');
    expect(result.data, isNotNull);
    expect(result.errorMessage, isNull);
    expect(result.data!.length > 0, isTrue);
    print(result.data?.first.accountId);
  });

  test('Fetch player ID then fetch ship stats', () async {
    final service = WargamingService();
    final playerInfo = await service.getPlayerId('henryquan');
    await service.getShipStats(playerInfo.data!.first.accountId.toString());
  });
}
