import 'package:flutter_test/flutter_test.dart';
import 'package:yuyuko_live/service/file_service.dart';
import 'package:yuyuko_live/service/battle_service.dart';

void main() {
  test('Read json file from path', () async {
    ///TODO: This is an absolute path
    final battle_file = FileService(path: 'H:\\yuyuko-live\\yuyuko_live\\test');
    await battle_file.load();
    print(battle_file.json);
  });
  
  test('Read battleinfo json file from path', () async {
    ///TODO: This is an absolute path
    final battle_file = BattleService(path: 'H:\\yuyuko-live\\yuyuko_live\\test');
    await battle_file.load();
    print(battle_file.json);
  });
}
