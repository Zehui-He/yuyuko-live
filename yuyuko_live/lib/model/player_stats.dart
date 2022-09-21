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
    required Weaponary mainBattery,
    required int suppressionsCount,
    required int maxDamageScouting,
    required int artAgro,
    required int shipsSpotted,
    required Weaponary secondBattery,
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
    required Weaponary ramming,
    required Weaponary torpedoes,
    required Weaponary aircraft,
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

// The Mainbatery class and Aircraft class are integrated into the Weaponary class
@freezed
abstract class Weaponary with _$Weaponary {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Weaponary({
    required int maxFragsBattle,
    required int frags,
    int? hits,
    int? shots,
  }) = _Weaponary;

  factory Weaponary.fromJson(Map<String, dynamic> json) =>
      _$WeaponaryFromJson(json);
}
