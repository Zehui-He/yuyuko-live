import 'package:flutter/foundation.dart';

@immutable
class ShipInformation {
  const ShipInformation({
    this.shipId,
    this.shipInfo,
    this.data,
  });

  final int? shipId;
  final ShipInfo? shipInfo;
  final ShipPRData? data;

  factory ShipInformation.fromJson(Map<String, dynamic> json) =>
      ShipInformation(
        shipId: json['shipId'] == null ? null : json['shipId'],
        shipInfo: json['shipInfo'] == null
            ? null
            : ShipInfo.fromJson(json['shipInfo']),
        data: json['data'] == null ? null : ShipPRData.fromJson(json['data']),
      );
}

@immutable
class ShipPRData {
  const ShipPRData({
    this.winRate,
    this.averageDamageDealt,
    this.averageFrags,
  });

  final double? winRate;
  final double? averageDamageDealt;
  final double? averageFrags;

  factory ShipPRData.fromJson(Map<String, dynamic> json) => ShipPRData(
        winRate: json['winRate'] == null ? null : json['winRate'].toDouble(),
        averageDamageDealt: json['averageDamageDealt'] == null
            ? null
            : json['averageDamageDealt'].toDouble(),
        averageFrags: json['averageFrags'] == null
            ? null
            : json['averageFrags'].toDouble(),
      );
}

@immutable
class ShipInfo {
  const ShipInfo({
    this.nameCn,
    this.nameEnglish,
    this.level,
    this.shipType,
    this.country,
    this.imgSmall,
    this.imgLarge,
    this.imgMedium,
    this.shipIndex,
    this.groupType,
  });

  final String? nameCn;
  final String? nameEnglish;
  final int? level;
  final String? shipType;
  final String? country;
  final String? imgSmall;
  final String? imgLarge;
  final String? imgMedium;
  final String? shipIndex;
  final String? groupType;

  factory ShipInfo.fromJson(Map<String, dynamic> json) => ShipInfo(
        nameCn: json['nameCn'],
        nameEnglish: json['nameEnglish'],
        level: json['level'],
        shipType: json['shipType'],
        country: json['country'],
        imgSmall: json['imgSmall'],
        imgLarge: json['imgLarge'],
        imgMedium: json['imgMedium'],
        shipIndex: json['shipIndex'],
        groupType: json['groupType'],
      );
}
