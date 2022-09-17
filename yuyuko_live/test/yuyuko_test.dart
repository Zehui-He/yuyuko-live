import 'package:flutter_test/flutter_test.dart';
import 'package:yuyuko_live/service/yuyuko_service.dart';

void main() {
  test('Test Yuyuko Service', () async {
    final service = YuyukoService();
    final data = await service.getAllShipInfo();
    expect(data.data, isNotNull);
    expect(data.errorMessage, isNull);
    expect(data.data!.length > 0, isTrue);
    print(data.data?.first.shipId);
  });
}
