import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_info.freezed.dart';
part 'battle_info.g.dart';

@freezed
abstract class BattleInfo with _$BattleInfo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BattleInfo({
      required String matchGroup,
      required int gameMode,
      required String clientVersionFromExe,
      required int scenarioUiCategoryId,
      required String eventType,
      required String mapDisplayName,
      required int mapId,
      required String clientVersionFromXml,
      required Map<String, List<String>> weatherParams,
      required List<dynamic> disabledShipClasses,
      required int playersPerTeam,
      required int duration,
      required String gameLogic,
      required String name,
      required String scenario,
      required int playerId,
      required List<Vehicle> vehicles,
      required String gameType,
      required String dateTime,
      required String mapName,
      required String playerName,
      required int scenarioConfigId,
      required int teamsCount,
      required String logic,
      required String playerVehicle,
      required int battleDuration,
      required String mapBorder,
  }) = _BattleInfo;

  factory BattleInfo.fromJson(Map<String, dynamic> json) => _$BattleInfoFromJson(json);
}

@freezed
abstract class Vehicle with _$Vehicle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Vehicle({
      required int shipId,
      required int relation,
      required int id,
      required String name,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
