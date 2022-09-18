import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stats.freezed.dart';
part 'player_stats.g.dart';

@freezed
abstract class SingleShipStatistic with _$SingleShipStatistic {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SingleShipStatistic({
    Pvp? pvp,
    required int lastBattleTime,
    required int accountId,
    required int distance,
    required int updatedAt,
    required int battles,
    required int shipId,
    required dynamic private,
  }) = _SingleShipStatistic;

  factory SingleShipStatistic.fromJson(Map<String, dynamic> json) =>
      _$SingleShipStatisticFromJson(json);
}

@freezed
abstract class Pvp with _$Pvp {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pvp({
    required int maxXp,
    required int damageToBuildings,
    required MainBattery mainBattery,
    required int suppressionsCount,
    required int maxDamageScouting,
    required int artAgro,
    required int shipsSpotted,
    required MainBattery secondBattery,
    required int xp,
    required int survivedBattles,
    required int droppedCapturePoints,
    required int maxDamageDealtToBuildings,
    required int torpedoAgro,
    required int draws,
    required int planesKilled,
    required int battles,
    required int maxShipsSpotted,
    required int teamCapturePoints,
    required int frags,
    required int damageScouting,
    required int maxTotalAgro,
    required int maxFragsBattle,
    required int capturePoints,
    required Aircraft ramming,
    required MainBattery torpedoes,
    required Aircraft aircraft,
    required int survivedWins,
    required int maxDamageDealt,
    required int wins,
    required int losses,
    required int damageDealt,
    required int maxPlanesKilled,
    required int maxSuppressionsCount,
    required int teamDroppedCapturePoints,
  }) = _Pvp;

  factory Pvp.fromJson(Map<String, dynamic> json) => _$PvpFromJson(json);
}

@freezed
abstract class Aircraft with _$Aircraft {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Aircraft({
    required int maxFragsBattle,
    required int frags,
  }) = _Aircraft;

  factory Aircraft.fromJson(Map<String, dynamic> json) =>
      _$AircraftFromJson(json);
}

@freezed
abstract class MainBattery with _$MainBattery {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MainBattery({
    required int maxFragsBattle,
    required int frags,
    required int hits,
    required int shots,
  }) = _MainBattery;

  factory MainBattery.fromJson(Map<String, dynamic> json) =>
      _$MainBatteryFromJson(json);
}
